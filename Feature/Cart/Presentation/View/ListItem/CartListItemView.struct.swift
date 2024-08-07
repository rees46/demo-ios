import SwiftUI

struct CartListItemView: View {
    var cartItem: ProductCartItem
    var removeFromCart: () -> Void
    
    var body: some View {
        LazyVStack(spacing: 0) {
            HStack(spacing: Sizes.Spacing.standard) {
                RemoteImageView(
                    urlString: cartItem.product.imageUrl,
                    width: Sizes.Size.smallImageSize,
                    height: Sizes.Size.smallImageSize,
                    contentMode: .fit,
                    showBorder: false
                )
                
                VStack(alignment: .leading, spacing: Sizes.Spacing.small) {
                    Text(cartItem.product.brand)
                        .font(.system(size: Typography.FontSize.small))
                        .foregroundColor(AppColors.colorGray)
                    
                    Text(cartItem.product.name)
                        .font(.system(size: Typography.FontSize.standard))
                        .foregroundColor(AppColors.colorBlack)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text(String(format: NSLocalizedString("quantity_title", comment: ""), "\(cartItem.quantity)"))
                        .font(.system(size: Typography.FontSize.medium))
                        .foregroundColor(AppColors.colorBlack)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(cartItem.product.priceFormatted ?? "")
                    .font(.system(size: Typography.FontSize.standard))
                    .foregroundColor(AppColors.colorBlack)
                    .padding(.trailing, Sizes.Padding.xLarge)
                
                Button(action: removeFromCart) {
                    Image(systemName: "xmark")
                        .foregroundColor(AppColors.colorWhite)
                        .frame(width: Sizes.Size.smallIconSize, height: Sizes.Size.smallIconSize)
                        .background(AppColors.colorGray)
                        .clipShape(Circle())
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.vertical, Sizes.Padding.medium)
            .background(AppColors.colorWhite)
            
            Divider()
        }
        .listRowInsets(EdgeInsets())
        .background(Color.clear)
        .padding(.horizontal)
    }
}
