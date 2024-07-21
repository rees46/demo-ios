import SwiftUI

struct CartScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var cartViewModel: CartViewModel
    @State private var isLoading = true
    
    init(cartViewModel: CartViewModel = CartResolver.shared.resolveCartViewModel()) {
        self.cartViewModel = cartViewModel
    }
    
    var totalPrice: Int {
        let total = cartViewModel.cartItems.reduce(0) { (result, cartItem) in
            if let priceString = cartItem.product.priceFormatted,
               let price = Int(priceString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                return result + (price * cartItem.quantity)
            }
            return result
        }
        return total
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Spacer().frame(height: 20)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .onAppear {
                                Timer.after {
                                    isLoading = false
                                }
                            }
                            .frame(height: 250)
                    } else if cartViewModel.cartItems.isEmpty {
                        EmptyCartView()
                            .frame(height: 250)
                    } else {
                        CartListView(
                            cartItems: cartViewModel.cartItems,
                            removeFromCart: { productId in
                                cartViewModel.removeFromCart(productId: productId)
                            }
                        ).frame(height: 250)
                        
                        TotalPriceSection(totalPrice: totalPrice)
                        
                        NavigationButtonsView(
                            navigationManager: navigationManager,
                            cartViewModel: cartViewModel
                        )
                    }
                    
                    if !isLoading {
                        RecommendationSection(recommendedProducts: cartViewModel.recommenderProducts)
                    }
                }
                .navigationBarTitle("cart_tab_title")
                .onAppear {
                    navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
                    cartViewModel.loadRecommenderRecommendations(currentProductId: "665")
                }
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
    @ObservedObject var cartViewModel:CartViewModel
    
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
