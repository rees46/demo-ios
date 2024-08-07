import SwiftUI

struct RatingView: View {
    var rating: Double

    init(rating: Double) {
        if rating == 0 {
            self.rating = Double.random(in: 1...5)
        } else {
            self.rating = rating
        }
    }

    var body: some View {
        HStack(spacing: Sizes.Spacing.extraSmall) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.starType(for: index))
                    .foregroundColor(AppColors.ratingColor)
            }
        }
        .font(.caption)
        .padding(.top, Sizes.Padding.extraSmall)
        .padding(.bottom, Sizes.Padding.small)
    }
    
    private func starType(for index: Int) -> String {
        if Double(index) <= rating {
            return "star.fill"
        } else if Double(index) - rating < 1 {
            return "star.lefthalf.fill"
        } else {
            return "star"
        }
    }
}
