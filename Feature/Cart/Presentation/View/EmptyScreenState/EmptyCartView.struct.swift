import SwiftUI

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("empty_cart_title")
                .font(
                    .system(
                        size: Typography.FontSize.extraLarge,
                        weight: .bold
                    )
                )
                .foregroundColor(AppColors.colorGray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
