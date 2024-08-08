import Resolver
import SwiftUI

struct SearchScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: SearchViewModel
    
    @State private var localSearchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(
                localSearchText: $localSearchText,
                onClearSearch: {
                    localSearchText = ""
                    viewModel.clearSearchText()
                },
                onNavigateBack: {
                    navigationManager.navigateBack()
                },
                onChangeText: { newText in
                    viewModel.search(query: newText)
                }
            )
            
            SearchHistoryView(localSearchText: $localSearchText)
            
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
            }
            if let errorMessage = viewModel.errorMessage {
                SearchErrorView(errorMessage: errorMessage)
                    .onAppear {
                        print("Search results received: \(errorMessage)")
                    }
            } 
            if let searchResults = viewModel.searchResults {
                List(searchResults.products) { product in
                    HStack {
                        RemoteImageView(
                            urlString: product.imageUrl,
                            width: Sizes.Size.mediumImageSize,
                            height: Sizes.Size.mediumImageSize,
                            contentMode: .fit,
                            showBorder: false
                        )
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.system(size: Typography.FontSize.medium))
                                .padding(.horizontal)
                                .foregroundColor(AppColors.colorGray)
                            
                            Text("\(product.priceFormatted)")
                                .font(.system(size: Typography.FontSize.medium))
                                .padding(.horizontal)
                                .foregroundColor(AppColors.colorBlack)
                        }
                        .padding(.leading, Sizes.Padding.large)
                    }
                    .padding(.vertical, Sizes.Padding.medium)
                    .frame(height: Sizes.Size.searchButtonHeight)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, -20)
            }
            Spacer()
        }
        .background(AppColors.colorWhite)
        .onAppear {
            navigationManager.setVisibility(
                hideToolbar: true,
                hideBottomBar: true
            )
        }
    }
}
