import SwiftUI
import Foundation
import Resolver

extension ProductsScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .products
    }
}

struct ProductsScreenView: View {
    
    var product: RecommendedProduct?
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: ProductsViewModel
    
    @State private var selectedImageIndex = 0
    @State private var isLoading = true
    @State private var counter = 1
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if isLoading {
                    
                    LoadingView(isLoading: $isLoading)
                } else {
                    
                    if let product = product {
                        TopSectionView(product: product)
                        ProductImagesSectionView(product: product, selectedImageIndex: $selectedImageIndex)
                        ProductDetailsSectionView(product: product)
                        PriceSectionView(product: product)
                        ActionSectionView(product: product, counter: $counter, viewModel: viewModel)
                    } else {
                        Text("empty_products_title")
                            .font(.headline)
                            .foregroundColor(AppColors.colorBlack)
                            .padding()
                            .frame(height: Sizes.Size.largeImageSize)
                    }
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.recommenderProducts,
                        title: NSLocalizedString("recommend_like_title", comment: "")
                    )
                    .onAppear {
                        viewModel.loadRecommenderRecommendations(currentProductId: AppConfigVariables.recommendationCode)
                    }
                    .padding(.vertical,Sizes.Spacing.extraLarge)
                }
            }
            .background(AppColors.colorWhite)
        }
        .onAppear {
            navigationManager.setVisibility(
                hideToolbar: false,
                hideBottomBar: false
            )
        }
    }
}
