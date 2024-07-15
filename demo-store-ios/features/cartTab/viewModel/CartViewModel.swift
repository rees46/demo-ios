import Foundation
import Combine

class CartViewModel: ObservableObject {
    
    @Published var cartItems: [ProductCartItem] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    
    private let getRecommendationsUseCase = GetRecommendationsUseCase()
    private let cartRepository = CartRepository.shared
    private var cancellables = Set<AnyCancellable>()
    
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    
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
    
    func loadRecommenderRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { products in
            self.recommenderProducts = products
        }
    }
}
