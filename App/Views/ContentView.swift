import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationManager = NavigationManager(
        initialScreen: ScreenWrapper(screen: HomeScreenView())
    )
    
    var body: some View {
        VStack(spacing: 0) {
            ToolbarView()
                .background(Color.black)
            
            MainViews()
            
            BottomBarView()
                .frame(height: 70)
                .background(Color.black)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .environmentObject(navigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}