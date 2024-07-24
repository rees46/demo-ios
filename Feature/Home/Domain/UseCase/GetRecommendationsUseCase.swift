import Foundation
import Combine
import REES46
import Resolver

class GetRecommendationsUseCase {
    
    @Injected var sdkManager: SDKManagingProtocol
    
    func execute(
        currentProductId: String,
        completion: @escaping ([RecommendedProduct]) -> Void
    ) {
        sdkManager.sdk?.recommend(
            blockId: AppConfigVariables.blockId,
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
