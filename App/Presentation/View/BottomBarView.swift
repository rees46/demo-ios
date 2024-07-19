import SwiftUI

struct BottomBarView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    // Используйте AnyView для экранов
    let tabs: [TabItem] = [
        TabItem(image: "MainTab", screen: AnyView(HomeScreenView()), type: .home),
        TabItem(image: "CatalogTab", screen: AnyView(ProductsScreenView()), type: .products),
        TabItem(image: "CartTab", screen: AnyView(CartScreenView()), type: .cart),
        TabItem(image: "SettingsTab", screen: AnyView(SettingsScreenView()), type: .settings)
    ]
    
    var body: some View {
        VStack {
            if !navigationManager.isBottomBarHidden {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        tabButton(tab)
                    }
                }
            }
        }
    }
    
    private func tabButton(_ tab: TabItem) -> some View {
        TabBarButton(image: tab.image, isSelected: navigationManager.selectedTab == tab.type)
            .onTapGesture {
                navigationManager.selectedTab = tab.type
                navigationManager.navigateTo(
                    screen: tab.screen,
                    selectedTab: tab.type
                )
            }
            .padding(.horizontal, tab.type == .home || tab.type == .settings ? 20 : 0)
    }
}

struct TabBarButton: View {
    var image: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 32, height: 32)
                .foregroundColor(isSelected ? .white : .gray)
            Spacer().frame(height: 30)
        }
    }
}
