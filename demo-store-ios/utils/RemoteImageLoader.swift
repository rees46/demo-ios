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
    let width: CGFloat?
    let height: CGFloat?
    let contentMode: ContentMode
    
    init(urlString: String, width: CGFloat? = nil, height: CGFloat? = nil, contentMode: ContentMode = .fit) {
        self.imageLoader = RemoteImageLoader(urlString: urlString)
        self.width = width
        self.height = height
        self.contentMode = contentMode
    }
    
    
    var body: some View {
        if let uiImage = UIImage(data: imageLoader.imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(width: width, height: height)
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
                .frame(width: width, height: height)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .clipped()
        }
    }
}
