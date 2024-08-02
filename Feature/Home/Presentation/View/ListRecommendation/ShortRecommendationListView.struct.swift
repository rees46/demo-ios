import SwiftUI

struct ShortRecommendationListView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var recommendedProducts: [RecommendedProduct]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: title) {
                navigationManager.navigateToScreen(
                    AnyView(
                        FullRecommendationListView(
                            recommendedProducts: recommendedProducts,
                            title: NSLocalizedString("reccomender_title", comment: "")
                        )
                    )
                )
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductListItemView(
                            product: product,
                            containerWidth: 140,
                            containerHeight: 270,
                            imageWidth: 140,
                            imageHeight: 140,
                            showShopButton: false
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct NewArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        let products = [
            RecommendedProduct(
                id: "1",
                barcode: "123456",
                name: "Product 1",
                brand: "Brand 1",
                model: "Model 1",
                description: "Description 1",
                imageUrl: "https://example.com/product1.jpg",
                resizedImageUrl: "https://example.com/product1_resized.jpg",
                url: "https://example.com/product1",
                deeplinkIos: "",
                categories: [],
                locations: [],
                price: 99.99,
                priceFormatted: "$99.99",
                priceFull: 129.99,
                priceFullFormatted: "$129.99",
                oldPrice: 10.0,
                oldPriceFormatted: "$129.99",
                oldPriceFull: 0.0,
                oldPriceFullFormatted: nil,
                currency: "USD",
                salesRate: 10,
                discount: 20,
                rating: 4,
                relativeSalesRate: 0.5,
                paramsRaw: nil,
                fashionOriginalSizes: [],
                fashionSizes: [],
                fashionColors: [],
                resizedImages: [:]
            ),
            RecommendedProduct(
                id: "2",
                barcode: "789012",
                name: "Product 2",
                brand: "Brand 2",
                model: "Model 2",
                description: "Description 2",
                imageUrl: "https://example.com/product2.jpg",
                resizedImageUrl: "https://example.com/product2_resized.jpg",
                url: "https://example.com/product2",
                deeplinkIos: "",
                categories: [],
                locations: [],
                price: 149.99,
                priceFormatted: "$109.99",
                priceFull: 179.99,
                priceFullFormatted: "$179.99",
                oldPrice: 0.0,
                oldPriceFormatted: "$129.99",
                oldPriceFull: 0.0,
                oldPriceFullFormatted: nil,
                currency: "USD",
                salesRate: 15,
                discount: 16,
                rating: 4,
                relativeSalesRate: 0.6,
                paramsRaw: nil,
                fashionOriginalSizes: [],
                fashionSizes: [],
                fashionColors: [],
                resizedImages: [:]
            )
        ]
        
        return ShortRecommendationListView(
            recommendedProducts: products,
            title:"Top products"
        )
    }
}