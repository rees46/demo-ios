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
            VStack(spacing: 0) {
                Spacer().frame(height: 20)
                
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else if viewModel.cartItems.isEmpty {
                    EmptyCartView()
                        .frame(height: 250)
                } else {
                    CartListView(
                        cartItems: viewModel.cartItems,
                        removeFromCart: { productId in
                            viewModel.removeFromCart(productId: productId)
                        }
                    ).frame(height: 250)
                    
                    TotalPriceSection(totalPrice: totalPrice)
                    
                    NavigationButtonsView(
                        navigationManager: navigationManager
                    )
                }
                
                if !isLoading {
                    RecommendationSection(recommendedProducts: viewModel.recommenderProducts)
                }
            }
            .navigationBarTitle("cart_tab_title")
            .onAppear {
                navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
                viewModel.loadRecommenderRecommendations()
            }
        }
    }
}

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("empty_cart_title")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RecommendationSection: View {
    var recommendedProducts: [RecommendedProduct]
    
    var body: some View {
        VStack {
            Spacer().frame(height: 36)
            
            ShortRecommendationListView(
                recommendedProducts: recommendedProducts,
                title: NSLocalizedString("recommend_like_title", comment: "")
            )
            
            Spacer().frame(height: 36)
        }
        .background(Color.white)
        .listRowInsets(EdgeInsets())
    }
}

struct TotalPriceSection: View {
    var totalPrice: Int
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Spacer().frame(height: 10)
            
            HStack {
                Spacer()
                Text("shipping_title")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                
                Text("Free")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
            
            HStack {
                Spacer()
                Text("total_title")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                
                Text("\(totalPrice)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
    }
}

struct NavigationButtonsView: View {
    
    @ObservedObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack{
            HStack(spacing: 16) {
                Button(
                    action: {
                        navigationManager.navigateBack()
                    }
                ) {
                    Text("continue_button")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
                Button(
                    action: {
                        // TODO Make purchase
                    }
                ) {
                    Text("checkout_button")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
        }
    }
}
