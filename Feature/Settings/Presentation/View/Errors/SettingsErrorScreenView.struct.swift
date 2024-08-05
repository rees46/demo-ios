import SwiftUI

struct SettingsErrorScreenView: View {
    let errorMessage: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(AppColors.colorRed)
                .padding()
            
            Button("retry_button_title") {
                retryAction()
            }
            .padding()
        }
    }
}
