import Resolver

extension Resolver {
    static func registerSdk() {
        register { SDKManager() as SDKManaging }.scope(.application)
    }
}
