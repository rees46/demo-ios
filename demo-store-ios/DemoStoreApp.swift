import SwiftUI

@main
struct DemoStoreApp: App {
    @StateObject private var diContainer = DIContainer()
    
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                LaunchScreen()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .environmentObject(diContainer)
            }
        }
    }
}
