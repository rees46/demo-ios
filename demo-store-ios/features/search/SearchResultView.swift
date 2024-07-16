
import Foundation
import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var recommendedProducts: [RecommendedProduct]
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            ScrollView {
                Spacer().frame(height: 20)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductListItemView(
                            product: product,
                            containerWidth: 170,
                            containerHeight: 280,
                            imageWidth: 170,
                            imageHeight: 170,
                            showShopButton: true
                        ).padding(20)
                    }
                }
            }
        }
        .background(Color.white)
    }
}
