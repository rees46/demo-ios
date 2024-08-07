//import SwiftUI
//
//struct LaunchScreen: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        let viewController = UIViewController()
//        let splashScreenView = SplashScreenView()
//        
//        // Create UIHostingController with SplashScreenView
//        let hostingController = UIHostingController(rootView: splashScreenView)
//        
//        // Embedding the SwiftUI view in a UIViewController
//        viewController.addChild(hostingController)
//        viewController.view.addSubview(hostingController.view)
//        
//        // Set constraints to make SplashScreenView fill the entire screen
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: viewController.view.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor)
//        ])
//        hostingController.didMove(toParent: viewController)
//        
//        return viewController
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // No update needed here
//    }
//}
