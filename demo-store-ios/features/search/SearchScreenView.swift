
import SwiftUI

struct SearchScreenView:View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack(alignment: .leading) {
            
        }
        .background(Color.white)
        .onAppear{
            navigationManager.setToolbarHidden(hidden: true)
        }
    }
}
