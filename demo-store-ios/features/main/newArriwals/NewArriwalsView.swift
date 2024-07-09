import SwiftUI

struct NewArrivalsView: View {
    var recommendedProducts: [RecommendedProduct]
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "New Arrivals") {
                // Button action here if needed
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(recommendedProducts, id: \.id) { product in
                        ProductItemView(product: product)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


struct ProductItemView: View {
    var product: RecommendedProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            RemoteImageView(urlString: product.resizedImageUrl)

            
            Text(product.brand)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            Text(product.name)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            RatingView(rating: Double(product.rating))
            
            if let oldPrice = product.oldPriceFormatted {
                Text(oldPrice)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .strikethrough()
            }
            
            Text(product.priceFormatted ?? "")
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .cornerRadius(10)
        .frame(width: 140, height: 260)
        
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
                oldPriceFormatted: nil,
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
        
        return NewArrivalsView(recommendedProducts: products)
    }
}
