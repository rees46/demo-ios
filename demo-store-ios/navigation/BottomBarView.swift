import SwiftUI
import Combine

struct BottomBarView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                TabBarButton(image: "MainTab", isSelected: navigationManager.currentScreenType == MainScreenView.self)
                    .onTapGesture {
                        navigationManager.navigateTo(screen: AnyView(MainScreenView()))
                    }
                    .padding(.leading, 20)
                
                Spacer()
                
                TabBarButton(image: "CatalogTab", isSelected: navigationManager.currentScreenType == CatalogScreenView.self)
                    .onTapGesture {
                        navigationManager.navigateTo(screen: AnyView(CatalogScreenView()))
                    }
                
                Spacer()
                
                TabBarButton(image: "CartTab", isSelected: navigationManager.currentScreenType == CartScreenView.self)
                    .onTapGesture {
                        navigationManager.navigateTo(screen: AnyView(CartScreenView()))
                    }
                
                Spacer()
                
                TabBarButton(image: "SettingsTab", isSelected: navigationManager.currentScreenType == SettingsScreenView.self)
                    .onTapGesture {
                        navigationManager.navigateTo(screen: AnyView(SettingsScreenView()))
                    }
                    .padding(.trailing, 20)
            }
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
