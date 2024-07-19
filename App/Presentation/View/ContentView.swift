import SwiftUI
import REES46

struct ContentView: View {
    
    @StateObject var navigationManager = NavigationManager(initialScreen: HomeScreenView())
 
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ToolbarView()
                
                navigationManager.currentScreen
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .edgesIgnoringSafeArea(.bottom)
                
                BottomBarView()
                    .environmentObject(navigationManager)
                    .frame(height: 70)
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .statusBar(hidden: false)
        .environmentObject(navigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
