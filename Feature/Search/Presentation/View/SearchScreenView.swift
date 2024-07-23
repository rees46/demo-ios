import SwiftUI
import Combine
import REES46

struct SearchScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel = SearchViewModel()
 
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    TextField("search_hint", text: $viewModel.searchText)
                        .padding(.leading, 10)
                        .padding(.trailing, 40)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6).stroke(
                                Color.gray.opacity(0.5),
                                lineWidth: 1
                            )
                        )
                    
                    if !viewModel.searchText.isEmpty {
                        HStack {
                            Spacer()
                            Button(
                                action: {
                                    viewModel.clearSearchText()
                                }
                            ) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
                
                Button(
                    action: {
                        navigationManager.navigateBack()
                    }
                ) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
            }
            .padding()
            
            // Search history section
            if !viewModel.searchHistory.isEmpty {
                VStack(alignment: .leading) {
                    Divider().background(Color.gray)
                    
                    Text("search_history_title")
                        .font(.system(size: 11))
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    
                    ForEach(viewModel.searchHistory, id: \.self) { query in
                        Text(query)
                            .font(.system(size: 14))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.searchText = query
                            }
                    }
                    
                    Divider().background(Color.gray)
                }
            }
            
            // Search results or loading/error message
            if viewModel.isLoading {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        ProgressView()
                            .frame(width: 36, height: 36)
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if let searchResults = viewModel.searchResults {
                List(searchResults.products) { product in
                    
                    HStack {
                        
                        RemoteImageView(
                            urlString: product.imageUrl,
                            width: 48,
                            height: 48,
                            contentMode: .fit,
                            showBorder: false
                        )
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.system(size: 14))
                                .padding(.horizontal)
                                .foregroundColor(.gray)
                            
                            Text("\(product.priceFormatted)")
                                .font(.system(size: 14))
                                .padding(.horizontal)
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                        
                    }
                    .padding(.vertical, 8)
                    .frame(height: 40)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, -20)
                
                if searchResults.productsTotal != 0 {
                    ViewAllButton(count: searchResults.productsTotal) {
                        let recommendedProducts = searchResults.products.map { RecommendedProduct.from(product: $0) }
                        navigationManager.navigateToScreen(
                            AnyView(
                                SearchResultView(
                                    recommendedProducts: recommendedProducts,
                                    count: searchResults.productsTotal
                                )
                            )
                        )
                    }
                    .padding(.bottom)
                }
            }
            
            Spacer()
        }
        .background(Color.white)
        .onAppear {
            navigationManager.setVisibility(hideToolbar: true, hideBottomBar: true)
        }
    }
}

struct ViewAllButton: View {
    let count: Int
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(String(format: NSLocalizedString("view_all_button", comment: ""), "\(count)"))
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .padding(.horizontal)
                Spacer()
            }
            .frame(height: 44)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding([.leading, .trailing])
        }
    }
}
