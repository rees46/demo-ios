import SwiftUI

struct CartScreenView: View {
    @ObservedObject var cartViewModel = CartViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Cart Items:")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                List(cartViewModel.cartItems) { cartItem in
                    VStack(alignment: .leading) {
                        Text(cartItem.product.name)
                            .font(.headline)
                        Text("Price: \(cartItem.product.priceFormatted ?? "")")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle("Cart")
            }
        }
    }
}
