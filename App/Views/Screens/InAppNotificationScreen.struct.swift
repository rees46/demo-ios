import SwiftUI
import Resolver

struct InAppNotificationScreen: View {
    @Injected var viewModel: HomeViewModel
    
    @StateObject private var widgetController = NotificationWidgetController()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button("Show Alert") {
                widgetController.showAlert()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button("Show Bottom Sheet") {
                widgetController.showBottomSheet()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button("Show Full Screen Alert") {
                widgetController.showFullScreenAlert()
            }
            .buttonStyle(PrimaryButtonStyle())

        }
        .padding()
        .background(NotificationWidgetView(widgetController: widgetController))
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
