import Foundation
import Combine
import PersonaClick
import Resolver

class ProductsViewModel {
    
    @Injected var cartRepository: CartRepository
    @Injected var getRecommendationsUseCase: GetRecommendationsUseCase
    
    @Published var recommenderProducts: [RecommendedProduct] = []
    @Published var isLoading = true
    
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

}
