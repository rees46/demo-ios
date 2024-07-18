import SwiftUI
import Combine

protocol ToolbarConfigurable {
    var isToolbarHidden: Bool { get }
}

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
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                
                HStack(spacing: 20) {
                    
                    Image("MenuIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .padding(.leading, 12)
                    
                    Spacer()
                    
                    Image("SearchIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .onTapGesture {
                            navigationManager.navigateTo(
                                screen: AnyView(SearchScreenView()),
                                selectedTab: navigationManager.selectedTab
                            )
                        }
                    
                    Image("CartIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .padding(.trailing, 12)
                        .onTapGesture {
                            navigationManager.navigateTo(
                                screen: AnyView(CartScreenView()),
                                selectedTab: .cart
                            )
                        }
                }
            }
            .background(Color.white)
        }
    }
}
