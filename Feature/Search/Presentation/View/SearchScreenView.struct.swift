import SwiftUI
import Resolver

struct SearchScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: SearchViewModel
    
    @State private var localSearchText: String = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                SearchBarView(
                    localSearchText: Binding(
                        get: { localSearchText },
                        set: { newValue in
                            localSearchText = newValue
                            search(query: newValue)
                        }
                    ),
                    onClearSearch: {
                        localSearchText = ""
                        viewModel.clearSearchText()
                    },
                    onNavigateBack: {
                        navigationManager.navigateBack()
                        
                    }
                )
                
                SearchHistoryView(localSearchText: $localSearchText)
                
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else if let errorMessage = viewModel.errorMessage {
                    SearchErrorView(errorMessage: errorMessage)
                } else if let searchResults = viewModel.searchResults {
                    SearchResultsListView(searchResults: searchResults)
                }
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
    
    private func search(query: String) {
        guard !query.isEmpty else {
            viewModel.clearSearchResults()
            return
        }
        isLoading = true
        viewModel.search(query: query) { success in
            isLoading = false
        }
    }
}
