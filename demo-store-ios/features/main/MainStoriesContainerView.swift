import SwiftUI
import UIKit
import REES46

struct MainStoriesContainerView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Stories")
                .font(.title)
                .foregroundColor(.black)
                .padding(.horizontal)
            
                .padding(.horizontal)
                .padding(.bottom, 16)
        }
    }
}

struct MainStoriesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainStoriesContainerView()
    }
}
