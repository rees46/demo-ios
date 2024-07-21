import Foundation
import SwiftUI

protocol ScreenTypeProvider {
    static var screenType: ScreenType { get }
}

struct ScreenWrapper: Identifiable {
    let id = UUID()
    let screen: AnyView
    let type: ScreenType
    
    init<T: View>(screen: T) where T: ScreenTypeProvider {
        self.screen = AnyView(screen)
        self.type = T.screenType
    }
}

extension HomeScreenView: ScreenTypeProvider {
    static var screenType: ScreenType {
        .home
    }
}

extension ProductsScreenView: ScreenTypeProvider {
    static var screenType: ScreenType {
        .products
    }
}

extension CartScreenView: ScreenTypeProvider {
    static var screenType: ScreenType {
        .cart
    }
}

extension SettingsScreenView: ScreenTypeProvider {
    static var screenType: ScreenType {
        .settings
    }
}
