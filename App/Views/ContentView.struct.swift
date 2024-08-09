import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationManager = NavigationManager(
        initialScreen: ScreenWrapper(screen: HomeScreenView())
    )
    
    var body: some View {
        VStack(spacing: 0) {
            ToolbarView()
                .background(AppColors.colorBlack)
            
            MainViews()
            
            BottomBarView()
                .frame(height: Sizes.Size.commonHeight)
                .background(AppColors.colorBlack)
        }
        .background(AppColors.colorBlack.edgesIgnoringSafeArea(.all))
        .environmentObject(navigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
