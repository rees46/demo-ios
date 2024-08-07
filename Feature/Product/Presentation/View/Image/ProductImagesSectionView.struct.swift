import SwiftUI

struct ProductImagesSectionView: View {
    var product: RecommendedProduct
    @Binding var selectedImageIndex: Int
    
    var body: some View {
        VStack {
            let imageUrls = Array(product.resizedImages.values.sorted())
            TabView(selection: $selectedImageIndex) {
                ForEach(imageUrls.indices, id: \.self) { index in
                    RemoteImageView(
                        urlString: imageUrls[index],
                        width: Sizes.Size.xxLargeImageSize,
                        height: Sizes.Size.xxLargeImageSize,
                        contentMode: .fit,
                        showBorder: false
                    ).tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: Sizes.Size.largeImage)
            
            Spacer().frame(height: Sizes.Spacing.large)
            
            HStack {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedImageIndex ? AppColors.colorBlack : AppColors.colorGray)
                        .frame(width: Sizes.Spacing.medium, height: Sizes.Spacing.medium)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}
