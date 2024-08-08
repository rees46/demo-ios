import SwiftUI

struct SearchViewAllProductsButton: View {
    
    let count: Int
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(String(format: NSLocalizedString("view_all_button", comment: ""), "\(count)"))
                    .foregroundColor(AppColors.colorBlack)
                    .font(.system(size: Typography.FontSize.medium))
                    .padding(.horizontal)
                Spacer()
            }
            .frame(height: Sizes.Size.searchButtonHeight)
            .background(AppColors.colorWhite)
            .cornerRadius(Sizes.CornerRadius.medium)
            .overlay(
                RoundedRectangle(cornerRadius: Sizes.CornerRadius.medium)
                    .stroke(AppColors.colorGray.opacity(0.5), lineWidth: 1)
            )
            .padding([.leading, .trailing])
        }
    }
}
