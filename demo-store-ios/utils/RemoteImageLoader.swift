import Combine
import SwiftUI

class RemoteImageLoader: ObservableObject {
    @Published var imageData = Data()
    private var cancellable: AnyCancellable?
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: Data())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                self?.imageData = data
            }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct RemoteImageView: View {
    @StateObject var imageLoader = RemoteImageLoader()
    let urlString: String
    let width: CGFloat?
    let height: CGFloat?
    let contentMode: ContentMode
    
    init(
        urlString: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        contentMode: ContentMode = .fit
    ) {
        self.urlString = urlString
        self.width = width
        self.height = height
        self.contentMode = contentMode
    }
    
    var body: some View {
        ZStack {
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
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: width, height: height)
                    .cornerRadius(5)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
                    .padding()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: urlString)
        }
        .onDisappear {
            imageLoader.cancel()
        }
        .clipped()
    }
}
