import SwiftUI
import Combine
import PersonaClick
import Resolver

class SearchViewModel: ObservableObject {
    
    @Injected var sdkManager: SDKManaging
    
    @Published var searchText: String = ""
    @Published var searchResults: SearchProductResponse? = nil
    @Published var errorMessage: String? = nil
    @Published var searchHistory: [String] = []
    @Published var totalItemCount: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.search(query: searchText)
            }
            .store(in: &cancellables)
    }
    
    func search(
        query: String,
        completion: @escaping (Bool) -> Void = {_ in }
    ) {
        guard !query.isEmpty else {
            clearSearchResults()
            completion(false)
            return
        }
        
        errorMessage = nil
        
        sdkManager.sdk?.search(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.handleSearchSuccess(response: response, query: query)
                    completion(true)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                }
            }
        }
    }
    
    private func handleSearchSuccess(response: SearchResponse, query: String) {
        self.searchResults = SearchProductResponse.from(response)
        self.updateSearchHistory(query: query)
        self.totalItemCount = self.searchResults?.productsTotal ?? 0
    }
    
    private func updateSearchHistory(query: String) {
        guard query.count >= 5, !searchHistory.contains(query) else { return }
        
        searchHistory.insert(query, at: 0)
        
        if searchHistory.count > 10 {
            searchHistory = Array(searchHistory.prefix(10))
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
    
    deinit {
        clearSearchResults()
    }
}
