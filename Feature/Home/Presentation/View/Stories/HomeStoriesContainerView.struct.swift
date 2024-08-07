import SwiftUI
import UIKit

struct HomeStoriesContainerView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.Spacing.standard) {
            Text("stories_title")
                .font(.system(size: Typography.FontSize.xxxLarge))
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.top, Sizes.Padding.xxxLarge)
            
            StoriesViewControllerRepresentable()
                .frame(height: Sizes.Size.storiesHeight)
        }
    }
}

struct HomeStoriesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoriesContainerView()
    }
}
