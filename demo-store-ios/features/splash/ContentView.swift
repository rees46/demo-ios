import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CustomTabView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        VStack {
            // Content
            switch selectedTab {
            case 0:
                MainScreenView()
            case 1:
                CatalogScreenView()
            case 2:
                CartScreenView()
            case 3:
                SettingsScreenView()
            default:
                MainScreenView()
            }
            
            Spacer()
            
            HStack {
                TabBarButton(image: "MainTab", isSelected: selectedTab == 0)
                    .onTapGesture {selectedTab = 0}
                    .padding(.leading, 20)
                
                Spacer()
                
                TabBarButton(image: "CatalogTab", isSelected: selectedTab == 1)
                    .onTapGesture { selectedTab = 1}
                
                Spacer()
                
                TabBarButton(image: "CartTab", isSelected: selectedTab == 2)
                    .onTapGesture {selectedTab = 2}
                
                Spacer()
                
                TabBarButton(image: "SettingsTab", isSelected: selectedTab == 3)
                    .onTapGesture { selectedTab = 3 }
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
            Spacer().frame(height: 20)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
