import SwiftUI
import UIKit

struct MainStoriesContainerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Stories")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.top, 32)
            
            StoriesViewControllerRepresentable()
                .frame(height: 200)
        }
        .environmentObject(MainTabViewModel())
    }
}

struct MainStoriesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainStoriesContainerView()
    }
}
