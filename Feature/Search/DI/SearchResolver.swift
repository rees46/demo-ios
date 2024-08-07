import Foundation
import Resolver

extension Resolver {
    static func registerSearchServices() {
        register { SearchViewModel() }.scope(.application)
    }
}
