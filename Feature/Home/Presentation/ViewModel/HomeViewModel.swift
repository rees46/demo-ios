import Foundation
import Combine
import PersonaClick
import Resolver

class HomeViewModel {
    
    @Injected var sdkManager: SDKManaging
    @Injected var cartRepository: CartRepository
    @Injected var getRecommendationsUseCase: GetRecommendationsUseCase
    
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    @Published var isLoading = true
    
    func loadAllRecommendations() {
        isLoading = true
        
        loadArrivalsRecommendations(currentProductId: AppConfigVariables.arrivalsCode) { [weak self] in
            self?.loadTopTrendRecommendations(currentProductId: AppConfigVariables.topTrendsCode) { [weak self] in
                self?.loadRecommenderRecommendations(currentProductId: AppConfigVariables.recommendationCode) { [weak self] in
                    self?.isLoading = false
                }
            }
        }
    }

    private func loadArrivalsRecommendations(currentProductId: String, completion: @escaping () -> Void) {
        getRecommendationsUseCase.execute(currentProductId: currentProductId) { [weak self] products in
            self?.arrivalsProducts = products
            completion()
        }
    }
    
    private func loadTopTrendRecommendations(currentProductId: String, completion: @escaping () -> Void) {
        getRecommendationsUseCase.execute(currentProductId: currentProductId) { [weak self] products in
            self?.topTrendProducts = products
            completion()
        }
    }
    
    private func loadRecommenderRecommendations(currentProductId: String, completion: @escaping () -> Void) {
        getRecommendationsUseCase.execute(currentProductId: currentProductId) { [weak self] products in
            self?.recommenderProducts = products
            completion()
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
