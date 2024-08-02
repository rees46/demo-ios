import SwiftUI

class NavigationManager: ObservableObject {
    
    @Published var currentScreen: ScreenWrapper
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentRootScreenType: RootScreenType = .home
    @Published var selectedTab: RootScreenType? = .home
    
    private var screenHistory: [ScreenWrapper] = []
    
    private let rootScreenInitializers: [RootScreenType: () -> AnyView] = [
        .home: { AnyView(HomeScreenView()) },
        .products: { AnyView(ProductsScreenView()) },
        .cart: { AnyView(CartScreenView()) },
        .settings: { AnyView(SettingsScreenView()) }
    ]
    
    init(initialScreen: ScreenWrapper) {
        self.currentScreen = initialScreen
        self.setStartDestinationScreen(initialScreen: initialScreen)
    }
    
    private func setStartDestinationScreen(initialScreen: ScreenWrapper) {
        self.currentScreen = initialScreen
        self.currentRootScreenType = initialScreen.type ?? .home
        self.screenHistory.append(self.currentScreen)
    }
    
    func navigateToRootScreen(screen: ScreenWrapper, selectedTab: RootScreenType? = .home) {
        self.currentScreen = screen
        self.selectedTab = selectedTab
        self.screenHistory.append(screen)
        self.currentRootScreenType = screen.type ?? .home
    }
    
    func navigateBack() {
        if screenHistory.count > 1 {
            screenHistory.removeLast()
            if let previousScreen = screenHistory.last {
                self.currentScreen = previousScreen
            }
        }
    }
    
    func navigateToScreen(_ view: any View) {
        let secondaryScreen = ScreenWrapper(
            screen: AnyView(view),
            type: nil
        )
        self.currentScreen = secondaryScreen
        self.screenHistory.append(secondaryScreen)
    }
    
    func setVisibility(hideToolbar: Bool, hideBottomBar: Bool) {
        self.isToolbarHidden = hideToolbar
        self.isBottomBarHidden = hideBottomBar
    }
}
