import SwiftUI
import UIKit
import PersonaClick
import Resolver

class StoriesViewController: UIViewController {
    
    var sdk: PersonalizationSDK?
    var storiesView: StoriesView?
    var storiesCode:String = "09d291f54de95e9e5bde43b343b0b0d7"
    
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
