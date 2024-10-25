import SwiftUI
import UIKit
import REES46

class NotificationWidgetController: ObservableObject {
    private var widget: NotificationWidget?
    
    func setViewController(_ viewController: UIViewController) {
        widget = NotificationWidget(parentViewController: viewController)
    }
    
    func showAlert() {
        widget?.showAlert(
            titleText: "REES46 Product Presentation",
            messageText: "Omni-channel recommendation engine with industry specific algorithms and online merchandising platform for brands manufacturers .",
            imageUrl: "https://image.slidesharecdn.com/rees46productpresentation-151112180026-lva1-app6891/75/REES46-Product-Presentation-1-2048.jpg",
            positiveButtonText: "Accept",
            negativeButtonText: "Decline",
            onPositiveButtonClick: {
                print("Alert Accepted")
            },
            onNegativeButtonClick: {
                print("Alert Declined")
            }
        )
    }
    
    func showBottomSheet() {
        widget?.showBottomSheet(
            titleText: "Bottom Sheet Title",
            messageText: "This is a bottom sheet message.",
            imageUrl: "https://image.slidesharecdn.com/rees46productpresentation-151112180026-lva1-app6891/75/REES46-Product-Presentation-1-2048.jpg",
            positiveButtonText: "Accept",
            negativeButtonText: "Decline",
            onPositiveButtonClick: {
                print("Bottom Sheet Accepted")
            },
            onNegativeButtonClick: {
                print("Bottom Sheet Declined")
            }
        )
    }
    
    func showFullScreenAlert() {
        widget?.showFullScreenAlert(
            titleText: "Full Screen Alert",
            messageText: "This is a full screen alert message.",
            imageUrl: "https://image.slidesharecdn.com/rees46productpresentation-151112180026-lva1-app6891/75/REES46-Product-Presentation-1-2048.jpg",
            positiveButtonText: "Accept",
            negativeButtonText: "Decline",
            onPositiveButtonClick: {
                print("Full Screen Alert Accepted")
            },
            onNegativeButtonClick: {
                print("Full Screen Alert Declined")
            }
        )
    }
}

struct NotificationWidgetView: UIViewControllerRepresentable {
    let widgetController: NotificationWidgetController

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        widgetController.setViewController(viewController)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
