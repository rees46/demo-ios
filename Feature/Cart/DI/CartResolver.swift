import Foundation
import Resolver

extension Resolver {
    static func registerCartServices() {
        register { CartViewModel() }.scope(.application)
        register { CartRepositoryImpl() as CartRepository }.scope(.application)
    }
}
