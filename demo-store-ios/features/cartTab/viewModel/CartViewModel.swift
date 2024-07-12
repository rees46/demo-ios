import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [ProductCartItem] = []
    
    private let cartRepository = CartRepository.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        cartRepository.$cartItems
            .sink { [weak self] cartItems in
                self?.cartItems = cartItems
            }
            .store(in: &cancellables)
    }
    
    func addToCart(product: RecommendedProduct, quantity: Int) {
        cartRepository.addToCart(product: product, quantity: quantity)
    }
    
    func updateCartItem(productId: String, quantity: Int) {
        cartRepository.updateCartItem(productId: productId, quantity: quantity)
    }
    
    func removeFromCart(productId: String) {
        cartRepository.removeFromCart(productId: productId)
    }
}
