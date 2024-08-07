import Foundation
import SwiftUI

struct RemoteImageView: View {
    
    @StateObject var imageLoader = RemoteImageLoader()
    let urlString: String
    let width: CGFloat?
    let height: CGFloat?
    let contentMode: ContentMode
    let showBorder: Bool
    
    init(
        urlString: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        contentMode: ContentMode = .fit,
        showBorder: Bool = true
    ) {
        self.urlString = urlString
        self.width = width
        self.height = height
        self.contentMode = contentMode
        self.showBorder = showBorder
    }
    
    var body: some View {
        ZStack {
            if let uiImage = UIImage(data: imageLoader.imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: width, height: height)
                    .cornerRadius(Sizes.CornerRadius.medium)
                    .overlay(
                        showBorder ?
                        RoundedRectangle(cornerRadius: Sizes.CornerRadius.large).stroke(
                            Color.gray.opacity(0.5),
                            lineWidth: Typography.FontSize.lineWidth
                        ) : nil
                    )
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: width, height: height)
                    .cornerRadius(Sizes.CornerRadius.medium)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
                    .padding()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: urlString)
        }
        .onDisappear {
            imageLoader.cancel()
        }
        .clipped()
    }
}
