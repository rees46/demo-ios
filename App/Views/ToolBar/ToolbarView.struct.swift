import SwiftUI
import Combine

struct ToolbarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        if !navigationManager.isToolbarHidden {
            VStack {
                ZStack {
                    Color.black
                    Image("ToolbarLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, Sizes.Padding.large)
                        .foregroundColor(.white)
                }
                .frame(height: Sizes.Size.commonHeight)
                
                HStack(spacing: Sizes.Spacing.large) {
                    
                    Image("MenuIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: Sizes.Size.smallIconSize, height: Sizes.Size.smallIconSize)
                        .foregroundColor(.black)
                        .padding(.leading, Sizes.Padding.xLarge)
                    
                    Spacer()
                    
                    Image("SearchIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: Sizes.Size.icon, height: Sizes.Size.icon)
                        .foregroundColor(.black)
                        .onTapGesture {
                            navigationManager.navigateToScreen(SearchScreenView())
                        }
                    
                    Image("CartIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: Sizes.Size.icon, height: Sizes.Size.icon)
                        .foregroundColor(.black)
                        .padding(.trailing, Sizes.Padding.xLarge)
                        .onTapGesture {
                            navigationManager.navigateToScreen(CartScreenView())
                        }
                }
            }
            .background(Color.white)
        }
    }
}
