import SwiftUI

struct CartScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var cartViewModel = CartViewModel()
    
    var totalPrice: Int {
        let total = cartViewModel.cartItems.reduce(0) { (result, cartItem) in
            if let priceString = cartItem.product.priceFormatted {
                let cleanedPriceString = priceString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                
                if let price = Int(cleanedPriceString) {
                    return result + price
                }
            }
            return result
        }
        print("Computed total price:", total)
        return total
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                
                List {
                    ForEach(cartViewModel.cartItems) { cartItem in
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
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(cartItem.product.priceFormatted ?? "")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 12)
                                
                                Button(
                                    action: {
                                        cartViewModel.removeFromCart(productId: cartItem.product.id)
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
                        .padding(.horizontal)
                    }
                    
                    VStack(spacing: 0) {
                        Spacer().frame(height: 20)
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .trailing, spacing: 12) {
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
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("cart_tab_title")
                .onAppear{
                    navigationManager.setToolbarHidden(hidden: false)
                }
            }
        }
    }
}
