import SwiftUI

struct BottomBarView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    private let tabs: [TabItem] = [
        TabItem(image: "MainTab", screen: ScreenWrapper(screen: HomeScreenView()), type: .home),
        TabItem(image: "CatalogTab", screen: ScreenWrapper(screen: ProductsScreenView()), type: .products),
        TabItem(image: "CartTab", screen: ScreenWrapper(screen: CartScreenView()), type: .cart),
        TabItem(image: "SettingsTab", screen: ScreenWrapper(screen: SettingsScreenView()), type: .settings)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            if !navigationManager.isBottomBarHidden {
                HStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        BottomBarButton(image: tab.image, isSelected: navigationManager.selectedTab == tab.type)
                            .onTapGesture {
                                navigationManager.selectedTab = tab.type
                                navigationManager.navigateToRootScreen(screen: tab.screen, selectedTab: tab.type)
                            }
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}
