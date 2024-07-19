
import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let image: String
    let screen: AnyView
    let type: ScreenType
}
