import Foundation

class HomeResolver {
    static let shared = HomeResolver()

    private init() {}

    func resolve<T>() -> T {
        if T.self == HomeViewModel.self {
            return HomeViewModel() as! T
        }
        if T.self == CartRepository.self {
            return CartRepository.shared as! T
        }
        if T.self == GetRecommendationsUseCase.self {
            return GetRecommendationsUseCase() as! T
        }
        if T.self == SDKManaging.self {
            return SDKManager.shared as! T
        }
        fatalError("Unsupported type")
    }
}
