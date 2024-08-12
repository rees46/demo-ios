import SwiftUI

struct SearchResultsListView: View {
    
    let searchResults: SearchProductResponse
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            List(searchResults.products) { product in
                HStack {
                    RemoteImageView(
                        urlString: product.imageUrl,
                        width: Sizes.Size.mediumImageSize,
                        height: Sizes.Size.mediumImageSize,
                        contentMode: .fit,
                        showBorder: false
                    )
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(.system(size: Typography.FontSize.medium))
                            .padding(.horizontal)
                            .foregroundColor(AppColors.colorGray)
                        
                        Text("\(product.priceFormatted)")
                            .font(.system(size: Typography.FontSize.medium))
                            .padding(.horizontal)
                            .foregroundColor(AppColors.colorBlack)
                    }
                    .padding(.leading, Sizes.Padding.large)
                }
                .padding(.vertical, Sizes.Padding.medium)
                .frame(height: Sizes.Size.searchButtonHeight)
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal, -Sizes.Padding.xxLarge)
            
            if searchResults.productsTotal != 0 {
                SearchViewAllProductsButton(count: searchResults.productsTotal) {
                    let recommendedProducts = searchResults.products.map { RecommendedProduct.from(product: $0) }
                    navigationManager.navigateToScreen(
                        SearchResultView(
                            recommendedProducts: recommendedProducts,
                            count: searchResults.productsTotal
                        )
                    )
                }
                .padding(.bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
