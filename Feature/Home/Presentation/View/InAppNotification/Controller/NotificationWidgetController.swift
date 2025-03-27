import SwiftUI
import UIKit
import PersonaClick

class NotificationWidgetController: ObservableObject {
    private var widget: NotificationWidget?
    
    func setViewController(_ viewController: UIViewController) {
        widget = NotificationWidget(parentViewController: viewController)
    }
    
    func showAlert() {
        widget?.showAlert(
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            confirmButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            dismissButtonText: NSLocalizedString("notification_decline_button", comment: ""),
            onConfirmButtonClick: {
                print("Alert dialog accepted")
            }
        )
    }
    
    func showBottomDialog() {
        widget?.showBottomDialog(
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            confirmButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            dismissButtonText: NSLocalizedString("notification_decline_button", comment: ""),
            onConfirmButtonClick: {
                print("Bottom dialog accepted")
            }
        )
    }
    
    func showTopDialog() {
        widget?.showTopDialog(
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            confirmButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            dismissButtonText: NSLocalizedString("notification_decline_button", comment: ""),
            onConfirmButtonClick: {
                print("Top dialog accepted")
            }
        )
    }
}
