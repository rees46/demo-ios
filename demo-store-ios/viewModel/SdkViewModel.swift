import Foundation
import Combine
import REES46

class SDKViewModel: ObservableObject {
    @Published var recommendedProducts: [RecommendedProduct] = []
    
    let sdkManager = SDKManager.shared
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    private let currentProductId = "646"
    
    func getRecommendations(blockId: String, currentProductId: String) {
           sdkManager.sdk?.recommend(blockId: blockId, currentProductId: currentProductId) { [weak self] response in
               guard let self = self else { return }
               switch response {
               case .success(let recommendResponse):
                   let products = RecommendedProductMapper.mapResponseToProducts(response: recommendResponse)
                   DispatchQueue.main.async {
                       self.recommendedProducts = products
                   }
               case .failure(let error):
                   print("Error:", error.localizedDescription)
               }
           }
       }
}
