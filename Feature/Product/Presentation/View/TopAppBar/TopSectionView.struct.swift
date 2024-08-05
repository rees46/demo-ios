import SwiftUI

struct TopSectionView: View {
    var product: RecommendedProduct
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 20)
            Text("Home / \(product.name) / \(product.brand)")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Spacer().frame(height: 20)
        }
        .padding(.horizontal)
    }
}
