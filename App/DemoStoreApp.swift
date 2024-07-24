import SwiftUI

@main
struct DemoStoreApp: App {
    @StateObject private var appState = AppState()
    
    init() {
        DependenciesInitialization.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            if appState.showSplash {
                SplashScreenView()
                    .environmentObject(appState)
            } else {
                ContentView()
            }
        }
    }
}
