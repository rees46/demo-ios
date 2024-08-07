import SwiftUI
import Foundation
import Resolver

extension CartScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .cart
    }
}

struct CartScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: CartViewModel
    
    @State private var isLoading = true
    
    var totalPrice: Int {
        let total = viewModel.cartItems.reduce(0) { (result, cartItem) in
            if let priceString = cartItem.product.priceFormatted,
               let price = Int(priceString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                return result + (price * cartItem.quantity)
            }
            return result
        }
        return total
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                Spacer().frame(height: Sizes.Spacing.large)
                
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else if viewModel.cartItems.isEmpty {
                    EmptyCartView().frame(height: Sizes.Size.largeContainerHeight)
                } else {
                    CartListView(
                        cartItems: viewModel.cartItems,
                        removeFromCart: { productId in
                            viewModel.removeFromCart(productId: productId)
                        }
                    ).frame(height: Sizes.Size.largeContainerHeight)
                    
                    CartTotalPriceSection(totalPrice: totalPrice)
                    
                    CartActionButtonsView(navigationManager: navigationManager)
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.recommenderProducts,
                        title: NSLocalizedString("recommend_like_title", comment: "")
                    )
                    .padding(.vertical,Sizes.Spacing.extraLarge)
                    .background(AppColors.colorWhite)
                }
            }
            .navigationBarTitle("cart_tab_title")
            .onAppear {
                navigationManager.setVisibility(
                    hideToolbar: false,
                    hideBottomBar: false
                )
                viewModel.loadRecommenderRecommendations()
            }
        }
    }
}
