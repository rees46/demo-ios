import SwiftUI

struct ProductListItemView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    var product: RecommendedProduct
    var containerWidth: CGFloat
    var containerHeight: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var showShopButton: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            RemoteImageView(
                urlString: product.resizedImageUrl,
                width: imageWidth,
                height: imageHeight
            )
            
            Text(product.brand)
                .font(.system(size: 12))
                .padding(.top, 8)
                .padding(.bottom, 4)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            Text(product.name)
                .font(.system(size: 19))
                .padding(.bottom, 4)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            RatingView(rating: Double(product.rating))
            
            if let oldPrice = product.oldPriceFormatted {
                Text(oldPrice)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .strikethrough()
            }
            
            HStack {
                Text(product.priceFormatted ?? "")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                if showShopButton {
                    Button(action: {
                        // TODO Действие по нажатию кнопки
                    }) {
                        Text("Shop")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 62, height: 28)
                            .background(Color.black)
                            .cornerRadius(3)
                    }
                }
            }
            
            Spacer()
        }
        .cornerRadius(10)
        .frame(width: containerWidth, height: containerHeight)
        .onTapGesture {
          navigationManager.navigateTo(
              screen: AnyView(
                CatalogScreenView(
                    product: product
                )
              ),
              selectedTab: .catalog
          )
      }
    }
}
