import Foundation
import Combine
import REES46

class SDKViewModel: ObservableObject {
    @Published var arrivalsProducts: [RecommendedProduct] = []
    @Published var topTrendProducts: [RecommendedProduct] = []
    @Published var recommenderProducts: [RecommendedProduct] = []

    let sdkManager = SDKManager.shared
    
    func getRecommendations(blockId: String, currentProductId: String, completion: @escaping ([RecommendedProduct]) -> Void) {
        sdkManager.sdk?.recommend(blockId: blockId, currentProductId: currentProductId) { response in
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
    
    func loadArrivalsRecommendations(blockId: String, currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.arrivalsProducts = products
        }
    }
    
    func loadTopTrendRecommendations(blockId: String, currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.topTrendProducts = products
        }
    }
    
    func loadRecommenderRecommendations(blockId: String, currentProductId: String) {
        getRecommendations(blockId: blockId, currentProductId: currentProductId) { products in
            self.recommenderProducts = products
        }
    }
}
