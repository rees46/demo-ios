import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentScreen: AnyView
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentScreenType: ScreenType = .none
    @Published var selectedTab: ScreenType? = .main
    
    init() {
        self.currentScreen = AnyView(HomeScreenView())
        self.currentScreenType = .main
    }
    
    func navigateTo<Content: View>(screen: Content, selectedTab: ScreenType? = .main) {
        
        self.currentScreen = AnyView(screen)
        self.selectedTab = selectedTab
        
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
        // Implement navigation back logic if needed
    }
}

enum ScreenType {
    case main
    case catalog
    case cart
    case settings
    case none
}
