import SwiftUI
import UIKit

struct HomeStoriesContainerView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("stories_title")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.top, 32)
            
            StoriesViewControllerRepresentable()
                .frame(height: 200)
        }
        .environmentObject(HomeViewModel())
    }
}

struct HomeStoriesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoriesContainerView()
    }
}
