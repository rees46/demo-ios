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
