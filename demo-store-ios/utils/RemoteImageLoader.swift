import Combine
import SwiftUI

class RemoteImageLoader: ObservableObject {
    @Published var imageData = Data()
    private var cancellable: AnyCancellable?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: Data())
            .receive(on: DispatchQueue.main)
            .assign(to: \.imageData, on: self)
    }
}

struct RemoteImageView: View {
    @ObservedObject var imageLoader: RemoteImageLoader
    let imageSize: CGFloat = 140
    
    init(urlString: String) {
        imageLoader = RemoteImageLoader(urlString: urlString)
    }
    
    var body: some View {
        if let uiImage = UIImage(data: imageLoader.imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .clipped()
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .clipped()
        }
    }
}
