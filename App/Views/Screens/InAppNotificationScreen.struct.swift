import SwiftUI
import Resolver

struct InAppNotificationScreen: View {
    @StateObject private var widgetController = NotificationWidgetController()
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.Padding.standard) {
            NotificationButton(title: NSLocalizedString("show_alert_dialog", comment: "")) {
                widgetController.showAlert()
            }
            NotificationButton(title: NSLocalizedString("show_bottom_dialog", comment: "")) {
                widgetController.showBottomDialog()
            }
            NotificationButton(title: NSLocalizedString("show_top_dialog", comment: "")) {
                widgetController.showTopDialog()
            }
        }
        .padding()
        .background(NotificationWidgetRepresentable(widgetController: widgetController))
    }
}
