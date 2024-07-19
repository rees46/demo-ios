import SwiftUI

class NavigationManager: ObservableObject {
    @Published var currentScreen: AnyView
    @Published var isToolbarHidden: Bool = false
    @Published var isBottomBarHidden: Bool = false
    @Published var currentScreenType: ScreenType = .none
    @Published var selectedTab: ScreenType? = .home
    
    private var screenHistory: [AnyView] = []
    
    init<Content: View & VisitableScreen>(initialScreen: Content) {
        self.currentScreen = AnyView(initialScreen)
        let visitor = ScreenTypeVisitor()
        initialScreen.accept(visitor: visitor)
        self.currentScreenType = visitor.screenType
        self.screenHistory.append(self.currentScreen)
    }
    
    func navigateTo<Content: View & VisitableScreen>(screen: Content, selectedTab: ScreenType? = .home) {
        let anyView = AnyView(screen)
        self.currentScreen = anyView
        self.selectedTab = selectedTab
        self.screenHistory.append(anyView)
        
        let visitor = ScreenTypeVisitor()
        screen.accept(visitor: visitor)
        self.currentScreenType = visitor.screenType
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
