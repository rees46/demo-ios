import SwiftUI

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
