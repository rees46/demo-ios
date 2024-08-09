import SwiftUI

struct ActionSectionView: View {
    
    var product: RecommendedProduct
    @Binding var counter: Int
    var viewModel: ProductsViewModel
    
    var body: some View {
        HStack {
            CounterSectionView(counter: $counter)
                .frame(height: Sizes.Size.commonHeight)
                .background(AppColors.colorWhite)
                .border(AppColors.colorGray, width: Sizes.BorderWidth.standard)
                .cornerRadius(Sizes.CornerRadius.medium)
            
            Spacer().frame(width: Sizes.Spacing.standard)
            
            Button(
                action: {
                    viewModel.addToCart(product: product, quantity: counter)
                }
            ) {
                Text("add_to_cart_button_title")
                    .font(.system(size: Typography.FontSize.medium, weight: .bold))
                    .foregroundColor(AppColors.colorWhite)
                    .frame(maxWidth: .infinity, maxHeight: Sizes.Size.commonHeight)
                    .background(AppColors.colorBlack)
                    .cornerRadius(Sizes.CornerRadius.standard)
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
}
