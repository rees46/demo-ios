import SwiftUI

struct CatalogScreenView: View {
    
    var product: RecommendedProduct?
    
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Spacer().frame(height: 20)
                    
                    Text("Home / \(product?.name ?? "") / \(product?.brand ?? "")")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 20)
                    
                    if let product = product {
                        let imageUrls = Array(product.resizedImages.values.sorted())
                        
                        TabView(selection: $selectedImageIndex) {
                            ForEach(imageUrls.indices, id: \.self) { index in
                                RemoteImageView(
                                    urlString: imageUrls[index],
                                    width: 350,
                                    height: 350,
                                    contentMode: .fill
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
                    
                    Spacer().frame(height: 20)
                    
                    
                }
            }
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
