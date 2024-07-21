import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationManager = NavigationManager(initialScreen: ScreenWrapper(screen: HomeScreenView()))
 
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ToolbarView()
                
                navigationManager.currentScreen.screen
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
