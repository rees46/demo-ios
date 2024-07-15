import Foundation
import Combine
import REES46

class MainTabViewModel: ObservableObject {
    
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    let sdkManager = SDKManager.shared
    
    @Published var isLoading = true
    
    private let cartRepository = CartRepository.shared
    private let getRecommendationsUseCase = GetRecommendationsUseCase()
    
    func loadArrivalsRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { products in
            self.arrivalsProducts = products
            self.isLoading = false
        }
    }
    
    func loadTopTrendRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { products in
            self.topTrendProducts = products
            self.isLoading = false
        }
    }
    
    func loadRecommenderRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { products in
            self.recommenderProducts = products
            self.isLoading = false
        }
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
