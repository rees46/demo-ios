import SwiftUI

enum ViewState {
    case loading
    case error(String)
    case data
}

struct SettingsScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    @State private var storeKey: String = ""
    @State private var viewState: ViewState = .loading
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewState {
                case .loading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            // Start a timer to simulate loading
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                loadData()
                            }
                        }
                    
                case .error:
                    SettingsErrroScreenView() {
                        navigationManager.navigateTo(screen: AnyView(MainScreenView()))
                    }
                    
                case .data:
                    SettingsInputCodeView(storeKey: $storeKey)
                }
            }
            .padding()
            .navigationTitle("settings_tab_title")
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
    private func loadData() {
        // Simulate data loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let success = Bool.random()
            if success {
                viewState = .data
            } else {
                viewState = .error("Failed to load data")
            }
        }
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
