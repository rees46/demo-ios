import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let image: String
    let screen: ScreenWrapper
    let type: RootScreenType
}
