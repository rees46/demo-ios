import SwiftUI

struct ProductDetailsSectionView: View {
    
    var product: RecommendedProduct
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer().frame(height: Sizes.Spacing.large)
            Text(product.brand)
                .font(.system(size: Typography.FontSize.standard))
                .foregroundColor(AppColors.colorBlack)
                .lineLimit(1)
            Spacer().frame(height: Sizes.Spacing.small)
            
            Text(product.name)
                .font(.system(size: Typography.FontSize.xxxLarge, weight: .bold))
                .foregroundColor(AppColors.colorBlack)
                .lineLimit(1)
            Spacer().frame(height: Sizes.Spacing.medium)
            
            HStack {
                RatingView(rating: Double(product.rating))
                
                Spacer().frame(width: Sizes.Spacing.medium)
                Text("\(Int.random(in: 1...100))")
                    .font(.system(size: Typography.FontSize.small))
                    .foregroundColor(AppColors.colorBlack)
                    .lineLimit(1)
                Text("rating_reviews")
                    .font(.system(size: Typography.FontSize.small))
                    .foregroundColor(AppColors.colorBlack)
                    .lineLimit(1)
            }
            
            Spacer().frame(height: Sizes.Spacing.medium)
            Text(product.description)
                .font(.system(size: Typography.FontSize.medium, weight: .regular))
                .foregroundColor(AppColors.colorBlack)
                .lineSpacing(Sizes.Padding.medium)
        }
        .padding(.horizontal)
    }
}
