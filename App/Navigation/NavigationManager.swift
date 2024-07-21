import SwiftUI

class NavigationManager: ObservableObject {
    
    @Published var currentScreen: ScreenWrapper
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentScreenType: ScreenType = .none
    @Published var selectedTab: ScreenType? = .home
    
    private var screenHistory: [ScreenWrapper] = []
    
    init(initialScreen: ScreenWrapper) {
        self.currentScreen = initialScreen
        self.currentScreenType = initialScreen.type
        self.screenHistory.append(self.currentScreen)
    }
    
    func navigateTo<Screen: View>(_ screen: Screen) where Screen: ScreenTypeProvider {
        let screenWrapper = ScreenWrapper(screen: screen)
        self.navigateTo(screen: screenWrapper)
    }
    
    func navigateTo(screen: ScreenWrapper, selectedTab: ScreenType? = .home) {
        self.currentScreen = screen
        self.selectedTab = selectedTab
        self.screenHistory.append(screen)
        self.currentScreenType = screen.type
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
}
