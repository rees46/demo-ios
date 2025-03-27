import SwiftUI
import UIKit
import PersonaClick
import Resolver

struct StoriesViewControllerRepresentable: UIViewControllerRepresentable {
    
    @Injected var viewModel: HomeViewModel
    
    func makeUIViewController(context: Context) -> StoriesViewController {
        let viewController = StoriesViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: StoriesViewController, context: Context) {
        if let sdk = viewModel.sdkManager.sdk {
            uiViewController.configure(with: sdk)
        } else {
            print("StoriesViewControllerRepresentable: SDK not found")
        }
    }
}
