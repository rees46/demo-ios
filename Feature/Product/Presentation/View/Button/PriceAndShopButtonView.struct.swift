import SwiftUI

struct PriceAndShopButtonView: View {
    
    var product: RecommendedProduct
    var showShopButton: Bool
    var viewModel: ProductsViewModel
    
    var body: some View {
        HStack {
            Text(product.priceFormatted ?? "")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.primary)
            
            Spacer()
            
            if showShopButton {
                Button(
                    action: {
                        viewModel.addToCart(product: product, quantity: 1)
                    }
                ) {
                    Text("shop_button_title")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .frame(width: 62, height: 28)
                        .background(Color.black)
                        .cornerRadius(3)
                }
            }
        }
    }
}
