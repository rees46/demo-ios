import SwiftUI
import Combine

class TabSelection: ObservableObject {
    @Published var selectedTabIndex = 0
}

struct BottomBarView: View {
    @ObservedObject var tabSelection: TabSelection
    
    var body: some View {
        VStack {
            switch tabSelection.selectedTabIndex {
            case 0: MainScreenView()
            case 1: CatalogScreenView()
            case 2: CartScreenView()
            case 3: SettingsScreenView()
            default: MainScreenView()
            }
            
            Spacer()
            
            HStack {
                TabBarButton(image: "MainTab", isSelected: tabSelection.selectedTabIndex == 0)
                    .onTapGesture { tabSelection.selectedTabIndex = 0 }
                    .padding(.leading, 20)
                
                Spacer()
                
                TabBarButton(image: "CatalogTab", isSelected: tabSelection.selectedTabIndex == 1)
                    .onTapGesture { tabSelection.selectedTabIndex = 1 }
                
                Spacer()
                
                TabBarButton(image: "CartTab", isSelected: tabSelection.selectedTabIndex == 2)
                    .onTapGesture { tabSelection.selectedTabIndex = 2 }
                
                Spacer()
                
                TabBarButton(image: "SettingsTab", isSelected: tabSelection.selectedTabIndex == 3)
                    .onTapGesture { tabSelection.selectedTabIndex = 3 }
                    .padding(.trailing, 20)
            }
            .frame(height: 70)
            .background(Color.black)
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
