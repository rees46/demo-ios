import Foundation

class CartResolver {
    static let shared = CartResolver()
    
    private init() {}
    
    func resolveCartViewModel() -> CartViewModel {
        return CartViewModel(
            cartRepository: resolveCartRepository(),
            getRecommendationsUseCase: resolveGetRecommendationsUseCase()
        )
    }
    
    func resolveCartRepository() -> CartRepository {
        return CartRepository.shared
    }
    
    func resolveGetRecommendationsUseCase() -> GetRecommendationsUseCase {
        return GetRecommendationsUseCase()
    }
}
