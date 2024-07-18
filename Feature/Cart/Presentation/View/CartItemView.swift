
import SwiftUI

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
