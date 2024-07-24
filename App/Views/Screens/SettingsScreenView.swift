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
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onAppear{
            navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
            //TODO: Chage to real loading
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

struct SettingsErrorScreenView: View {
    let errorMessage: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
            
            Button("Retry") {
                retryAction()
            }
            .padding()
        }
    }
}
