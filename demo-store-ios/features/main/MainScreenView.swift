import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<1) { _ in
                        MainDiscoverView()
                    }
                }
                .padding(.vertical, 16)
            }
            .navigationTitle("main_tab_title")
            .onAppear {
                navigationManager.setToolbarHidden(hidden: false)
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environmentObject(NavigationManager())
    }
}
