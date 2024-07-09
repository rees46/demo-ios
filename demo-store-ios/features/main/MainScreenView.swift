import SwiftUI
import REES46

struct MainScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    MainDiscoverView()
                    
                    MainStoriesContainerView()
                    
                    
                    SectionHeaderView(title: NSLocalizedString("arrivals_title", comment: "")) {
                        // Button action here
                    }
                    
                    SectionHeaderView(title: NSLocalizedString("top_trend_title", comment: "")) {
                        // Button action here
                    }
                    
                    SectionHeaderView(title: NSLocalizedString("reccomender_title", comment: "")) {
                        // Button action here
                    }
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .top)
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
