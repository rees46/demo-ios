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
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            positiveButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            negativeButtonText: NSLocalizedString("notification_decline_button", comment: ""),
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
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            positiveButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            negativeButtonText: NSLocalizedString("notification_decline_button", comment: ""),
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
            titleText: NSLocalizedString("notification_alert_title", comment: ""),
            messageText: NSLocalizedString("notification_alert_message", comment: ""),
            imageUrl: AppConfigVariables.inAppNotificationImageUrl,
            positiveButtonText: NSLocalizedString("notification_accept_button", comment: ""),
            negativeButtonText: NSLocalizedString("notification_decline_button", comment: ""),
            onPositiveButtonClick: {
                print("Full Screen Alert Accepted")
            },
            onNegativeButtonClick: {
                print("Full Screen Alert Declined")
            }
        )
    }
}
