import Resolver

struct DependenciesInitialization {
    static func initialize() {
        Resolver.registerSdk()
        Resolver.registerHomeServices()
        Resolver.registerProductsServices()
        Resolver.registerCartServices()
        Resolver.registerSearchServices()
    }
}
