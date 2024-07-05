import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ToolbarView()
                
                navigationManager.currentScreen
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

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
