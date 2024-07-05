import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    @Published var currentScreen: AnyView
    @Published var isToolbarHidden: Bool = false
    @Published var currentScreenType: Any.Type
    
    init() {
        self.currentScreen = AnyView(MainScreenView())
        self.currentScreenType = MainScreenView.self
    }
    
    func navigateTo<Content: View>(screen: Content) {
        self.currentScreen = AnyView(screen)
        self.currentScreenType = type(of: screen)
    }
    
    func setToolbarHidden(hidden: Bool) {
           self.isToolbarHidden = hidden
       }
    
    func navigateBack() {
        // Implement navigation back logic if needed
    }
}
