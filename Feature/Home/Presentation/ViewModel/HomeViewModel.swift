import Foundation
import Combine
import REES46
import Resolver

class HomeViewModel {
    
    @Injected var sdkManager: SDKManagingProtocol
    @Injected var cartRepository: CartRepositoryProtocol
    @Injected var getRecommendationsUseCase: GetRecommendationsUseCase
    
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    @Published var isLoading = true
    
    func loadArrivalsRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(
            currentProductId: currentProductId
        ) { [weak self] products in
            self?.arrivalsProducts = products
            self?.isLoading = false
        }
    }
    
    func loadTopTrendRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(
            currentProductId: currentProductId
        ) { [weak self] products in
            self?.topTrendProducts = products
            self?.isLoading = false
        }
    }
    
    func loadRecommenderRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(
            currentProductId: currentProductId
        ) { [weak self] products in
            self?.recommenderProducts = products
            self?.isLoading = false
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
