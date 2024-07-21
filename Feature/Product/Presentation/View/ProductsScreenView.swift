import SwiftUI

struct ProductsScreenView: View {
    
    var product: RecommendedProduct?
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel = HomeViewModel()
  
    @State private var selectedImageIndex = 0
    @State private var isLoading = true
    @State private var counter = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .onAppear {
                                Timer.after {
                                    isLoading = false
                                }
                            }
                            .frame(height: 250)
                    } else {
                        
                        if product != nil {
                            topSection
                            
                            productImagesSection
                            
                            productDetailsSection
                            
                            priceSection
                            
                            actionSection
                            
                        } else {
                            Text("No product available")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(height:300)
                        }
                        recomendSection
                    }
                }
                .background(Color.white)
            }
            .onAppear {
                if let product = product {
                    print("DATA \(product)")
                } else {
                    print("DATA is nil")
                }
                navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
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
        }.padding(.horizontal)
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
                            contentMode: .fit,
                            showBorder: false
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
        }.padding(.horizontal)
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
        }.padding(.horizontal)
    }
    
    private var priceSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Spacer().frame(height: 20)
            
            Text(product?.oldPriceFormatted ?? "₽ 42")
                .font(.system(size: 18))
                .foregroundColor(.secondary)
                .strikethrough()
            
            HStack {
                Text(product?.priceFormatted ?? "")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer().frame(width: 12)
                
                Text("\(Int.random(in: 1...50))%")
                    .font(.system(size: 16))
                    .frame(width: 46, height: 14)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.red)
                    .cornerRadius(8)
            }
            Spacer().frame(height: 20)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var actionSection: some View {
        HStack {
            CounterSectionView(counter: $counter)
                .frame(height: 50)
                .background(Color.white)
                .border(Color.gray, width: 1)
                .cornerRadius(4)
            
            Spacer().frame(width: 16)
            
            Button(
                action: {
                    if let product = product {
                        viewModel.addToCart(product: product, quantity: counter)
                    }
                }
            ) {
                Text("Add to Cart")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.black)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
    
    private var recomendSection: some View {
        VStack{
            Spacer().frame(height : 36)
            
            ShortRecommendationListView(
                recommendedProducts: viewModel.recommenderProducts,
                title: NSLocalizedString("recommend_like_title", comment: "")
            )
            .onAppear {
                viewModel.loadRecommenderRecommendations(currentProductId: "665")
            }
            
            Spacer().frame(height: 36)
        }
    }
}

struct CounterSectionView: View {
    @Binding var counter: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                if counter > 0 {
                    counter -= 1
                }
            }) {
                Text("-")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
            }
            
            Text("\(counter)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
                .background(Color.white)
            
            Button(action: {
                counter += 1
            }) {
                Text("+")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
            }
        }
    }
}
