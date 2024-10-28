import Foundation
import SwiftUI

struct NotificationWidgetRepresentable: UIViewControllerRepresentable {
    let widgetController: NotificationWidgetController

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        widgetController.setViewController(viewController)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

