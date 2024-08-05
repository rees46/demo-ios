import SwiftUI

struct ProductImageView: View {
    var urlString: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        RemoteImageView(
            urlString: urlString,
            width: width,
            height: height
        )
    }
}
