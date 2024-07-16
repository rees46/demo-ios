import SwiftUI
import Combine
import REES46

class SearchViewModel: ObservableObject {
    let sdkManager = SDKManager.shared
    
    @Published var searchText: String = ""
    @Published var searchResults: LocalSearchResponse? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchHistory: [String] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                self?.search(query: searchText)
            }
            .store(in: &cancellables)
    }
    
    func search(query: String) {
        guard !query.isEmpty else {
            searchResults = nil
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        sdkManager.sdk?.search(
            query: query,
            limit: nil,
            offset: nil,
            categoryLimit: nil,
            categories: nil,
            extended: nil,
            sortBy: nil,
            sortDir: nil,
            locations: nil,
            brands: nil,
            filters: nil,
            priceMin: nil,
            priceMax: nil,
            colors: nil,
            fashionSizes: nil,
            exclude: nil,
            email: nil,
            timeOut: nil,
            disableClarification: nil
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.searchResults = LocalSearchResponse.from(response)
                    self?.updateSearchHistory(query: query)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    private func updateSearchHistory(query: String) {
        if query.count >= 5 && !searchHistory.contains(query) {
            searchHistory.insert(query, at: 0)
            
            if searchHistory.count > 10 {
                searchHistory = Array(searchHistory.prefix(10))
            }
        }
    }
    
    func clearSearchResults() {
        searchResults = nil
    }
    
    func clearErrorMessage() {
        errorMessage = nil
    }
    
    func clearSearchText() {
        searchText = ""
    }
    
}
