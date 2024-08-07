import Foundation
import Resolver

extension Resolver {
    static func registerHomeServices() {
        register { HomeViewModel() }.scope(.application)
        register { GetRecommendationsUseCase() }.scope(.application)
    }
}
