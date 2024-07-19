import Foundation

protocol ScreenVisitor {
    func visit(_ screen: VisitableScreen)
}

protocol VisitableScreen {
    func accept(visitor: ScreenVisitor)
}

class ScreenTypeVisitor: ScreenVisitor {
    var screenType: ScreenType = .none
    
    func visit(_ screen: VisitableScreen) {
        switch screen {
        case let homeScreen as HomeScreenView:
            screenType = .main
        case let productsScreen as ProductsScreenView:
            screenType = .productsScreen
        case let cartScreen as CartScreenView:
            screenType = .cart
        case let settingsScreen as SettingsScreenView:
            screenType = .settings
        default:
            screenType = .none
        }
    }
}
