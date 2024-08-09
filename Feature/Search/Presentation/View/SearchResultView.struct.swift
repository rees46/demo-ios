import SwiftUI

struct SearchResultView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var recommendedProducts: [RecommendedProduct]
    var count: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: Sizes.Size.commonHeight)
            
            SearchResultHeaderView(navigationManager: _navigationManager)
            
            SearchResultInfoView(count: count)
            
            SearchResultProductGridView(recommendedProducts: recommendedProducts)
                .padding(.horizontal)
                .padding(.bottom, Sizes.Padding.xxLarge)
        }
        .background(AppColors.colorWhite)
        .edgesIgnoringSafeArea(.all)
    }
}
