import SwiftUI

struct ProductInfoView: View {
    var product: RecommendedProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(product.brand)
                .font(.system(size: 12))
                .padding(.top, 8)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            Text(product.name)
                .font(.system(size: 19))
                .foregroundColor(.primary)
                .lineLimit(1)
            
            RatingView(rating: Double(product.rating))
            
            if let oldPrice = product.oldPriceFormatted {
                Text(oldPrice)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .strikethrough()
            }
        }
    }
}
