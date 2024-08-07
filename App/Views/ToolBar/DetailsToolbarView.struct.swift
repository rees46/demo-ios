import SwiftUI

struct DetailsToolbarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            RemoteImageView(
                urlString: "https://png.pngtree.com/thumb_back/fw800/background/20240121/pngtree-set-of-various-kinds-girls-dress-in-same-color-image_15613096.jpg"
            )
            
            VStack {
                ZStack {
                    Image("ToolbarLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                
                HStack(spacing: 20) {
                    Image("MenuIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.leading, 12)
                    
                    Spacer()
                    
                    Image("SearchIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .onTapGesture {
                            navigationManager.navigateToScreen(SearchScreenView())
                        }
                    
                    Image("CartIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .padding(.trailing, 12)
                        .onTapGesture {
                            navigationManager.navigateToScreen(CartScreenView())
                        }
                }
            }
            .padding(.horizontal, 10)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailsToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsToolbarView()
    }
}
