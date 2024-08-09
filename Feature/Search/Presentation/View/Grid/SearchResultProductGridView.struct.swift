import SwiftUI

struct SearchResultProductGridView: View {
    var recommendedProducts: [RecommendedProduct]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Sizes.Spacing.standard) {
                ForEach(recommendedProducts, id: \.id) { product in
                    ProductListItemView(
                        product: product,
                        containerWidth: Sizes.Size.largeImage,
                        containerHeight: Sizes.Size.largeImageWidth,
                        imageWidth: Sizes.Size.largeImage,
                        imageHeight: Sizes.Size.largeImage,
                        showShopButton: true
                    ).padding(Sizes.Padding.xxLarge)
                }
            }
        }
    }
}
