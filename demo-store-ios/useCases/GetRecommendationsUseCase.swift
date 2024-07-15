import Foundation
import Combine
import REES46

class GetRecommendationsUseCase {
    
    private let sdkManager = SDKManager.shared
    
    func execute(blockId: String, currentProductId: String, completion: @escaping ([RecommendedProduct]) -> Void) {
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
}
