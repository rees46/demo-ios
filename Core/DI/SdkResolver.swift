import Resolver

extension Resolver {
    static func registerSdk() {
        register { SDKManager() as SDKManagingProtocol }.scope(.application)
    }
}
