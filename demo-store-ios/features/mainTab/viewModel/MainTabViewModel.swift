import Foundation
import Combine
import REES46

class MainTabViewModel: ObservableObject {
    
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []
    
    let sdkManager = SDKManager.shared
    
    func getRecommendations(blockId: String, currentProductId: String, completion: @escaping ([RecommendedProduct]) -> Void) {
        sdkManager.sdk?.recommend(
            blockId: blockId,
            currentProductId: currentProductId
        ) { response in
            switch response {
            case .success(let recommendResponse):
                let products = RecommendedProductMapper.mapResponseToProducts(response: recommendResponse)
                DispatchQueue.main.async {
                    completion(products)
                }
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    func loadArrivalsRecommendations( currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.arrivalsProducts = products
        }
    }
    
    func loadTopTrendRecommendations( currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.topTrendProducts = products
        }
    }
    
    func loadRecommenderRecommendations( currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.recommenderProducts = products
        }
    }
}
