import SwiftUI

class SDKViewModel: ObservableObject {
    let sdkManager = SDKManager.shared
    
    func performSDKAction() {
        // Use sdkManager.sdk to perform actions
        if let sdk = sdkManager.sdk {
            // Example of using sdk
        }
    }
    
    func loadStories() {
           // Perform actions to load stories if needed
       }
}
