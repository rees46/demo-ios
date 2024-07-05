import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationView {
            VStack {
                Text("main_tab_title")
                    .foregroundColor(.white)
            }
            .navigationTitle("main_tab_title")
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .onAppear {
                navigationManager.setToolbarHidden(hidden: false)
            }
        }
    }
}
