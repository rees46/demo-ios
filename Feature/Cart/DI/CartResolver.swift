import Foundation
import Resolver

extension Resolver {
    static func registerCartServices() {
        register { CartViewModel() }.scope(.application)
        register { CartRepository() as CartRepositoryProtocol }.scope(.application)
    }
}
