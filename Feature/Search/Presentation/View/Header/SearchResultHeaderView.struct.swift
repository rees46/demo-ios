import SwiftUI

struct SearchResultHeaderView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        HStack {
            Button(action: {
                navigationManager.navigateBack()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(AppColors.colorBlack)
            }
            .padding(.leading, Sizes.Padding.standard)
            
            Text("search_result_title")
                .font(.system(size: Typography.FontSize.xxxLarge, weight: .bold))
                .foregroundColor(AppColors.colorBlack)
                .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                // TODO: Route to Filter screen
            }) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(AppColors.colorBlack)
            }
            .padding(.trailing, Sizes.Padding.standard)
            
            Button(action: {
                navigationManager.navigateToRootScreen(
                    screen: ScreenWrapper(screen: HomeScreenView()),
                    selectedTab: .home
                )
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(AppColors.colorBlack)
            }
            .padding(.trailing, Sizes.Padding.standard)
        }
        .frame(height: Sizes.Size.commonHeight)
        .background(AppColors.colorWhite)
    }
}
