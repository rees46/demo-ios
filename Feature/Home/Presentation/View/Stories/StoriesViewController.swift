import SwiftUI
import UIKit
import REES46
import Resolver

class StoriesViewController: UIViewController {
    
    var sdk: PersonalizationSDK?
    var storiesView: StoriesView?
    var storiesCode:String = "fcaa8d3168ab7d7346e4b4f1a1c92214"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    func configure(with sdk: PersonalizationSDK) {
        self.sdk = sdk
        let storiesView = StoriesView()
        self.storiesView = storiesView
        storiesView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storiesView)
        
        NSLayoutConstraint.activate(
            [
            storiesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storiesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storiesView.topAnchor.constraint(equalTo: view.topAnchor),
            storiesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        )
        
        storiesView.configure(sdk: sdk, mainVC: self, code: storiesCode)
    }
}

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
