import SwiftUI

struct CartScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var cartViewModel = CartViewModel()
    
    @State private var isLoading = true
    
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
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
                    
                    if !isLoading{
                        RecommendationSection(recommendedProducts: cartViewModel.recommenderProducts)
                    }
                }
                .navigationBarTitle("cart_tab_title")
                .onAppear {
                    navigationManager.setToolbarHidden(hidden: false)
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

struct CartListView: View {
    var cartItems: [ProductCartItem]
    var removeFromCart: (String) -> Void
    
    var body: some View {
        List {
            ForEach(cartItems) { cartItem in
                CartItemView(
                    cartItem: cartItem,
                    removeFromCart: {
                        removeFromCart(cartItem.product.id)
                    }
                )
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CartItemView: View {
    var cartItem: ProductCartItem
    var removeFromCart: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                RemoteImageView(
                    urlString: cartItem.product.imageUrl,
                    width: 64,
                    height: 64,
                    contentMode: .fit,
                    showBorder: false
                )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(cartItem.product.brand)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Text(cartItem.product.name)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text(String(format: NSLocalizedString("quantity_title", comment: ""), "\(cartItem.quantity)"))
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(cartItem.product.priceFormatted ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                
                Button(
                    action: {
                        removeFromCart()
                    }
                ) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.vertical, 8)
            .background(Color.white)
            
            Divider()
        }
        .listRowInsets(EdgeInsets())
        .background(Color.clear)
        .padding(.horizontal)
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
                        navigationManager.navigateTo(screen: AnyView(HomeScreenView()), selectedTab: .main)
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
