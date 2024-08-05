import SwiftUI
import Foundation

extension SettingsScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .settings
    }
}

struct SettingsScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    @State private var storeKey: String = ""
    @State private var viewState: ViewState = .loading
    
    var body: some View {
        VStack {
            Spacer()
            
            switch viewState {
            case .loading:
                LoadingView(isLoading: .constant(true))
                
            case .error(let errorMessage):
                SettingsErrorScreenView(errorMessage: errorMessage) {
                    navigationManager.navigateToRootScreen(
                        screen: ScreenWrapper(
                            screen: HomeScreenView()
                        ),
                        selectedTab: .home
                    )
                }
                
            case .data:
                SettingsInputCodeView(storeKey: $storeKey)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("settings_tab_title")
        .background(AppColors.colorWhite.edgesIgnoringSafeArea(.all))
        .onAppear{
            navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
            loadData()
        }
    }
    
    private func loadData() {
        Timer.after {
            let success = true
            if success {
                viewState = .data
            } else {
                viewState = .error("Failed to load data")
            }
        }
    }
}
