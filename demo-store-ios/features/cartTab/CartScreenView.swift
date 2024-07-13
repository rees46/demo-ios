import SwiftUI

struct CartScreenView: View {
    @ObservedObject var cartViewModel = CartViewModel()
    
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
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("cart_tab_title")
            }
        }
    }
}
