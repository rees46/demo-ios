import SwiftUI
import Resolver

struct ProductListItemView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: ProductsViewModel
    
    var product: RecommendedProduct
    var containerWidth: CGFloat
    var containerHeight: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var showShopButton: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.CornerRadius.small) {
            ProductImageView(urlString: product.resizedImageUrl, width: imageWidth, height: imageHeight)
            
            ProductInfoView(product: product)
            
            PriceAndShopButtonView(product: product, showShopButton: showShopButton, viewModel: viewModel)
            
            Spacer()
        }
        .cornerRadius(Sizes.CornerRadius.large)
        .frame(width: containerWidth, height: containerHeight)
        .onTapGesture {
            navigationManager.navigateToScreen(
                ProductsScreenView(product: product)
            )
        }
    }
}
