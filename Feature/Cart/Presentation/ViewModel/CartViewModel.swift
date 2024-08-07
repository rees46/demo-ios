import Foundation
import Combine
import Resolver

class CartViewModel {
    
    @Published var cartItems: [ProductCartItem] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    @Published var isLoading: Bool = true

    @Injected var cartRepository: CartRepository
    @Injected var getRecommendationsUseCase: GetRecommendationsUseCase
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        cartRepository.cartItemsPublisher
            .sink { [weak self] cartItems in
                self?.cartItems = cartItems
                self?.isLoading = false
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

    func loadRecommenderRecommendations() {
        getRecommendationsUseCase.execute(
            currentProductId: AppConfigVariables.recommendationCode
        ) { products in
            self.recommenderProducts = products
        }
    }
}
