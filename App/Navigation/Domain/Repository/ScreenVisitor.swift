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
        case _ as HomeScreenView:
            screenType = .home
        case _ as ProductsScreenView:
            screenType = .products
        case _ as CartScreenView:
            screenType = .cart
        case _ as SettingsScreenView:
            screenType = .settings
        default:
            screenType = .none
        }
    }
}
