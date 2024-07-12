import SwiftUI

struct CatalogScreenView: View {
    
    var product: RecommendedProduct?
    
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    topSection
                    productImagesSection
                    productDetailsSection
                    Spacer().frame(height: 20)
                    VStack {
                        if let oldPrice = product?.oldPriceFormatted {
                            Text(oldPrice)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .strikethrough()
                        }
                        
                        Spacer().frame(height: 4)
                        
                        HStack {
                            Text(product?.priceFormatted ?? "")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.horizontal)
                .background(Color.white)
            }
            .onAppear {
                if let product = product {
                    print("DATA \(product)")
                } else {
                    print("DATA is nil")
                }
            }
        }
    }
    
    private var topSection: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 20)
            Text("Home / \(product?.name ?? "") / \(product?.brand ?? "")")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Spacer().frame(height: 20)
        }
    }
    
    private var productImagesSection: some View {
        VStack {
            if let product = product {
                let imageUrls = Array(product.resizedImages.values.sorted())
                
                TabView(selection: $selectedImageIndex) {
                    ForEach(imageUrls.indices, id: \.self) { index in
                        RemoteImageView(
                            urlString: imageUrls[index],
                            width: 350,
                            height: 350,
                            contentMode: .fit
                        ).tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 300)
                
                Spacer().frame(height: 20)
                
                HStack {
                    ForEach(0..<imageUrls.count, id: \.self) { index in
                        Circle()
                            .fill(index == selectedImageIndex ? Color.black : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .frame(maxWidth: .infinity)
            } else {
                Text("No product data available")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    private var productDetailsSection: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 20)
            Text(product?.brand ?? "")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .lineLimit(1)
            Spacer().frame(height: 5)
            Text(product?.name ?? "")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .lineLimit(1)
            Spacer().frame(height: 12)
            HStack {
                RatingView(rating: Double(product?.rating ?? 0))
                Spacer().frame(width: 12)
                Text("\(Int.random(in: 1...100))")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text("rating_reviews")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            Spacer().frame(height: 12)
            Text(product?.description ?? "")
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.black)
                .lineSpacing(8)
        }
    }
}

struct CatalogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreenView(
            product: RecommendedProduct(
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
            )
        )
    }
}
