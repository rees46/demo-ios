import Foundation
import SwiftUI

struct MainViews: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        navigationManager.currentScreen.screen
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
    }
}
