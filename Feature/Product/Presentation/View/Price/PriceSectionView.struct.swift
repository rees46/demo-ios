import SwiftUI

struct PriceSectionView: View {
    var product: RecommendedProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.Spacing.small) {
            Spacer().frame(height: Sizes.Spacing.large)
            
            if let oldPrice = product.oldPriceFormatted {
                Text(oldPrice)
                    .font(.system(size: Typography.FontSize.large))
                    .foregroundColor(.secondary)
                    .strikethrough()
            }
            
            HStack {
                Text(product.priceFormatted ?? "")
                    .font(.system(size: Typography.FontSize.large, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer().frame(width: Sizes.Spacing.medium)
                
                Text("\(Int.random(in: 1...50))%")
                    .font(.system(size: Typography.FontSize.standard))
                    .frame(width: Sizes.Size.textFrameWidth, height: Sizes.Size.textFrameHeight)
                    .foregroundColor(AppColors.colorWhite)
                    .padding(Sizes.Padding.medium)
                    .background(AppColors.colorRed)
                    .cornerRadius(Sizes.CornerRadius.standard)
            }
            Spacer().frame(height: Sizes.Spacing.large)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
