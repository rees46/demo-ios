import Foundation
import SwiftUI

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
