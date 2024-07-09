import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= Int(self.rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .font(.caption)
        .padding(.top, 2)
        .padding(.bottom, 5)
    }
}
