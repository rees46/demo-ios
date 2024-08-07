import SwiftUI

struct CartActionButtonsView: View {
    
    @ObservedObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack{
            HStack(spacing: Sizes.Spacing.standard) {
                Button(
                    action: {
                        navigationManager.navigateBack()
                    }
                ) {
                    Text("continue_button")
                        .font(.system(size: Sizes.Spacing.standard))
                        .foregroundColor(AppColors.colorBlack)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(AppColors.colorWhite)
                        .cornerRadius(Sizes.CornerRadius.standard)
                        .overlay(
                            RoundedRectangle(cornerRadius: Sizes.CornerRadius.standard)
                                .stroke(AppColors.colorBlack, lineWidth: Sizes.BorderWidth.standard)
                        )
                }
                
                Button(
                    action: {
                        // TODO Make purchase
                    }
                ) {
                    Text("checkout_button")
                        .font(.system(size: Typography.FontSize.standard))
                        .foregroundColor(AppColors.colorWhite)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(AppColors.colorBlack)
                        .cornerRadius(Sizes.CornerRadius.large)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, Sizes.Padding.xxLarge)
        }
    }
}
