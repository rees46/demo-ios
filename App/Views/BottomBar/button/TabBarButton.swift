import SwiftUI

struct TabBarButton: View {
    var image: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: Sizes.Size.icon, height: Sizes.Size.icon)
                .foregroundColor(isSelected ? Colors.selectedForeground : Colors.unselectedForeground)
        }
    }
}