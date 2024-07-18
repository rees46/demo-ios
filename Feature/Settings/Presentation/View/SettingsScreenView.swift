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
                            loadData()
                        }
                    
                case .error(let errorMessage):
                    SettingsErrorScreenView(errorMessage: errorMessage) {
                        navigationManager.navigateTo(screen: AnyView(HomeScreenView()))
                    }
                    
                case .data:
                    SettingsInputCodeView(storeKey: $storeKey)
                }
            }
            .padding()
            .navigationTitle("settings_tab_title")
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .onAppear{
                navigationManager.setToolbarHidden(hidden: false)
            }
        }
    }
    
    private func loadData() {
        // Simulate data loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let success = true // Replace with actual condition to check data loading success
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

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
