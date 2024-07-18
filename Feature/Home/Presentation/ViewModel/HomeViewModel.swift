import Foundation
import Combine
import REES46

class HomeViewModel: ObservableObject {
    
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    @Published var isLoading = true
    
    private let cartRepository: CartRepository
    private let getRecommendationsUseCase: GetRecommendationsUseCase
    private let sdkManager: SDKManaging
    
    init(sdkManager: SDKManaging = SDKManager.shared,
         cartRepository: CartRepository = CartRepository.shared,
         getRecommendationsUseCase: GetRecommendationsUseCase = GetRecommendationsUseCase()) {
        self.sdkManager = sdkManager
        self.cartRepository = cartRepository
        self.getRecommendationsUseCase = getRecommendationsUseCase
    }
    
    func loadArrivalsRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { [weak self] products in
            self?.arrivalsProducts = products
            self?.isLoading = false
        }
    }
    
    func loadTopTrendRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { [weak self] products in
            self?.topTrendProducts = products
            self?.isLoading = false
        }
    }
    
    func loadRecommenderRecommendations(currentProductId: String) {
        getRecommendationsUseCase.execute(blockId: blockId, currentProductId: currentProductId) { [weak self] products in
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
