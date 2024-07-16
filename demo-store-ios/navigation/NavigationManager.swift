import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentScreen: AnyView
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentScreenType: ScreenType = .none
    @Published var selectedTab: ScreenType? = .main
    
    private var screenHistory: [AnyView] = []
    
    init() {
        let homeView = HomeScreenView()
        self.currentScreen = AnyView(homeView)
        self.currentScreenType = .main
        self.screenHistory.append(self.currentScreen)
    }
    
    func navigateTo<Content: View>(screen: Content, selectedTab: ScreenType? = .main) {
        self.currentScreen = AnyView(screen)
        self.selectedTab = selectedTab
        self.screenHistory.append(self.currentScreen)
        
        switch screen {
        case is HomeScreenView:
            self.currentScreenType = .main
        case is CatalogScreenView:
            self.currentScreenType = .catalog
        case is CartScreenView:
            self.currentScreenType = .cart
        case is SettingsScreenView:
            self.currentScreenType = .settings
        default:
            self.currentScreenType = .none
        }
    }
    
    func setToolbarHidden(hidden: Bool) {
        self.isToolbarHidden = hidden
    }
    
    func setBottomBarHidden(hidden: Bool) {
        self.isBottomBarHidden = hidden
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
}

enum ScreenType {
    case main
    case catalog
    case cart
    case settings
    case none
}
