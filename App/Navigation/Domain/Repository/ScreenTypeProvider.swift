import Foundation
import SwiftUI

protocol ScreenTypeProvider {
    static var screenType: RootScreenType { get }
}

struct ScreenWrapper: Identifiable {
    let id = UUID()
    let screen: AnyView
    let type: RootScreenType?
    
    init<T: View>(screen: T) where T: ScreenTypeProvider {
        self.screen = AnyView(screen)
        self.type = T.screenType
    }
    
    init(screen: AnyView, type: RootScreenType?) {
        self.screen = screen
        self.type = type
    }
}

extension HomeScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .home
    }
}

extension ProductsScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .products
    }
}

extension CartScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .cart
    }
}

extension SettingsScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .settings
    }
}
