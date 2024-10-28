import Foundation
import SwiftUI

struct NotificationButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: Typography.FontSize.medium, weight: .bold))
                .foregroundColor(AppColors.colorWhite)
                .frame(maxWidth: .infinity, maxHeight: Sizes.Size.commonHeight)
                .background(AppColors.colorBlack)
                .cornerRadius(Sizes.CornerRadius.standard)
        }
    }
}
