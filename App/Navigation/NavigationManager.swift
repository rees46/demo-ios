import SwiftUI

class NavigationManager: ObservableObject {
    
    @Published var currentScreen: ScreenWrapper
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentRootScreenType: RootScreenType = .home
    @Published var selectedTab: RootScreenType? = .home
    
    private var screenHistory: [ScreenWrapper] = []
    
    // Массив экранов для табов
    private let rootScreenInitializers: [RootScreenType: () -> AnyView] = [
        .home: { AnyView(HomeScreenView()) },
        .products: { AnyView(ProductsScreenView()) },
        .cart: { AnyView(CartScreenView()) },
        .settings: { AnyView(SettingsScreenView()) }
    ]
    
    init(initialScreen: ScreenWrapper) {
        self.currentScreen = initialScreen
        self.currentRootScreenType = initialScreen.type ?? .home
        self.screenHistory.append(self.currentScreen)
    }
    
    func navigateTo<Screen: View>(_ screen: Screen) where Screen: ScreenTypeProvider {
        let screenWrapper = ScreenWrapper(screen: screen)
        self.navigateToRootScreen(screen: screenWrapper)
    }
    
    func navigateToRootScreen(screen: ScreenWrapper, selectedTab: RootScreenType? = .home) {
        self.currentScreen = screen
        self.selectedTab = selectedTab
        self.screenHistory.append(screen)
        self.currentRootScreenType = screen.type ?? .home
    }
    
    func setVisibility(hideToolbar: Bool, hideBottomBar: Bool) {
        self.isToolbarHidden = hideToolbar
        self.isBottomBarHidden = hideBottomBar
    }
    
    func resetSelection() {
        self.selectedTab = nil
    }
    
    func navigateBack() {
        if screenHistory.count > 1 {
            screenHistory.removeLast()
            if let previousScreen = screenHistory.last {
                self.currentScreen = previousScreen
            }
        }
    }
    
    func rootScreen(for type: RootScreenType) -> ScreenWrapper {
        guard let initializer = rootScreenInitializers[type] else {
            return ScreenWrapper(screen: AnyView(EmptyView()), type: nil)
        }
        return ScreenWrapper(screen: initializer(), type: type)
    }
    
    func navigateToScreen(_ view: AnyView) {
        let secondaryScreen = ScreenWrapper(screen: view, type: nil)
        self.currentScreen = secondaryScreen
        self.screenHistory.append(secondaryScreen)
    }
}
