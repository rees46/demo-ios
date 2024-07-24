import Foundation
import Resolver

extension Resolver {
    static func registerProductsServices() {
        register { ProductsViewModel() }.scope(.application)
    }
}
