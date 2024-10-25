import SwiftUI
import Resolver

struct InAppNotificationScreen: View {
    @StateObject private var widgetController = NotificationWidgetController()
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.Padding.standard) {
            NotificationButton(title: "show_base_alert_dialog") {
                widgetController.showAlert()
            }
            NotificationButton(title: "show_base_bottom_sheet_dialog") {
                widgetController.showBottomSheet()
            }
            NotificationButton(title: "show_full_screen_dialog") {
                widgetController.showFullScreenAlert()
            }
        }
        .padding()
        .background(NotificationWidgetRepresentable(widgetController: widgetController))
    }
}
