import SwiftUI

struct FullRecommendationListView: View{
    
    @EnvironmentObject var navigationManager: NavigationManager
    var recommendedProducts: [RecommendedProduct]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            DetailsToolbarView()
            
            ScrollView {
                Spacer().frame(height: 20)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Sizes.Spacing.standard) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductListItemView(
                            product: product,
                            containerWidth: Sizes.Size.largeImage,
                            containerHeight: Sizes.Size.largeImageWidth,
                            imageWidth: Sizes.Size.largeImage,
                            imageHeight: Sizes.Size.largeImage,
                            showShopButton: true
                        ).padding(.bottom,Sizes.Padding.xxLarge)
                    }
                }
            }
        }
        .background(Color.white)
        .onAppear{
            navigationManager.setVisibility(
                hideToolbar: true,
                hideBottomBar: false
            )
        }
    }
}

struct FullRecommendationListView_Previews: PreviewProvider {
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
                priceFormatted: "$149.99",
                priceFull: 179.99,
                priceFullFormatted: "$179.99",
                oldPrice: 0.0,
                oldPriceFormatted: nil,
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
        
        return FullRecommendationListView(
            recommendedProducts: products,
            title: "Top Products"
        )
    }
}
