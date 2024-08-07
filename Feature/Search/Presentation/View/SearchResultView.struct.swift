import SwiftUI

struct SearchResultView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var recommendedProducts: [RecommendedProduct]
    var count: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer().frame(height: 50)
            
            HStack {
                Button(
                    action: {
                        navigationManager.navigateBack()
                    }
                ) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .padding(.leading, 16)
                
                Text("search_result_title")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(
                    action: {
                        // TODO: Route to Filter screen
                    }
                ) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 16)
                
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
                        .foregroundColor(.black)
                }
                .padding(.trailing, 16)
            }
            .frame(height: 50)
            .background(Color.white)
            
            HStack {
                Text("search_found_title")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                
                Text(String(format: NSLocalizedString("search_count_result", comment: ""), "\(count)"))
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            .background(Color.white)
            .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductListItemView(
                            product: product,
                            containerWidth: 170,
                            containerHeight: 280,
                            imageWidth: 170,
                            imageHeight: 170,
                            showShopButton: true
                        ).padding(20)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
