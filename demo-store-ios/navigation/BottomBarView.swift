import SwiftUI

struct BottomBarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var selectedTab: ScreenType? = .main
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                TabBarButton(image: "MainTab", isSelected: selectedTab == .main)
                    .onTapGesture {
                        selectedTab = .main
                        navigationManager.navigateTo(screen: AnyView(MainScreenView()), selectedTab: .main)
                    }
                    .padding(.leading, 20)
                
                Spacer()
                
                TabBarButton(image: "CatalogTab", isSelected: selectedTab == .catalog)
                    .onTapGesture {
                        selectedTab = .catalog
                        navigationManager.navigateTo(screen: AnyView(CatalogScreenView()), selectedTab: .catalog)
                    }
                
                Spacer()
                
                TabBarButton(image: "CartTab", isSelected: selectedTab == .cart)
                    .onTapGesture {
                        selectedTab = .cart
                        navigationManager.navigateTo(screen: AnyView(CartScreenView()), selectedTab: .cart)
                    }
                
                Spacer()
                
                TabBarButton(image: "SettingsTab", isSelected: selectedTab == .settings)
                    .onTapGesture {
                        selectedTab = .settings
                        navigationManager.navigateTo(screen: AnyView(SettingsScreenView()), selectedTab: .settings)
                    }
                    .padding(.trailing, 20)
            }
        }
        .onChange(of: navigationManager.selectedTab) { newTab in
            selectedTab = newTab
        }
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
