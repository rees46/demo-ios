import SwiftUI

struct SearchResultView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var recommendedProducts: [RecommendedProduct]
    var count: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer().frame(height: Sizes.Size.commonHeight)
            
            HStack {
                Button(
                    action: {
                        navigationManager.navigateBack()
                    }
                ) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(AppColors.colorBlack)
                }
                .padding(.leading, Sizes.Padding.standard)
                
                Text("search_result_title")
                    .font(.system(size: Typography.FontSize.xxxLarge, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(
                    action: {
                        // TODO: Route to Filter screen
                    }
                ) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(AppColors.colorBlack)
                }
                .padding(.trailing, Sizes.Padding.standard)
                
                Button(
                    action: {
                        navigationManager.navigateToRootScreen(
                            screen: ScreenWrapper(
                                screen: HomeScreenView()
                            ),
                            selectedTab: .home
                        )
                    }
                ) {
                    Image(systemName: "xmark")
                        .foregroundColor(AppColors.colorBlack)
                }
                .padding(.trailing, Sizes.Padding.standard)
            }
            .frame(height: Sizes.Size.commonHeight)
            .background(AppColors.colorWhite)
            
            HStack {
                Text("search_found_title")
                    .font(.system(size: Typography.FontSize.medium))
                    .foregroundColor(AppColors.colorBlack)
                
                Text(String(format: NSLocalizedString("search_count_result", comment: ""), "\(count)"))
                    .font(.system(size: Typography.FontSize.medium))
                    .foregroundColor(AppColors.colorGray)
            }
            .padding(.vertical, Sizes.Padding.medium)
            .background(AppColors.colorWhite)
            .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductListItemView(
                            product: product,
                            containerWidth: Sizes.Size.largeImage,
                            containerHeight: Sizes.Size.largeImageWidth,
                            imageWidth: Sizes.Size.largeImage,
                            imageHeight: Sizes.Size.largeImage,
                            showShopButton: true
                        ).padding(Sizes.Padding.xxLarge)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, Sizes.Padding.xxLarge)
            }
        }
        .background(AppColors.colorWhite)
        .edgesIgnoringSafeArea(.all)
    }
}
