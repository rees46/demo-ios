import SwiftUI

struct SearchScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    TextField("Search...", text: $viewModel.searchText)
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
                            Button(action: {
                                viewModel.clearSearchText()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }
                
                Button(action: {
                    navigationManager.navigateBack()
                }) {
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
                    }
                    
                    Divider().background(Color.gray)
                }
            }
            
            // Search results or loading/error message
            if viewModel.isLoading {
                ProgressView()
                    .padding()
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
                            contentMode: .fill,
                            showBorder: false
                        ) .padding(.horizontal)
                        
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
                        
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .onAppear{
                        print("ITEMS COUNT \(searchResults)")
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, -20)
            }
            
            Spacer()
        }
        .background(Color.white)
        .onAppear {
            navigationManager.setToolbarHidden(hidden: true)
        }
    }
}
