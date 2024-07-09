import Foundation
import Combine
import REES46

class SDKViewModel: ObservableObject {
    @Published var recommendedProducts: [RecommendedProduct] = []
    
    let sdkManager = SDKManager.shared
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    private let currentProductId = "644"
    
    func getRecommendations() {
        sdkManager.sdk?.recommend(blockId: blockId, currentProductId: currentProductId) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let recommendResponse):
                self.mapResponseToModel(response: recommendResponse)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    private func mapResponseToModel(response: REES46.RecommenderResponse) {
        let products = response.recommended.map { recommended -> RecommendedProduct in
            return RecommendedProduct(
                id: recommended.id,
                barcode: recommended.barcode,
                name: recommended.name,
                brand: recommended.brand,
                model: recommended.model,
                description: recommended.description,
                imageUrl: recommended.imageUrl,
                resizedImageUrl: recommended.resizedImageUrl,
                url: recommended.url,
                deeplinkIos: recommended.deeplinkIos,
                categories: recommended.categories.map { category in
                    Category(
                        id: category.id,
                        name: category.name,
                        url: category.url,
                        alias: category.alias,
                        parentId: category.parentId
                    )
                },
                locations: recommended.locations,
                price: recommended.price,
                priceFormatted: recommended.priceFormatted,
                priceFull: recommended.priceFull,
                priceFullFormatted: recommended.priceFullFormatted,
                oldPrice: recommended.oldPrice,
                oldPriceFormatted: recommended.oldPriceFormatted,
                oldPriceFull: recommended.oldPriceFull,
                oldPriceFullFormatted: recommended.oldPriceFullFormatted,
                currency: recommended.currency,
                salesRate: recommended.salesRate,
                discount: recommended.discount,
                rating: recommended.rating,
                relativeSalesRate: recommended.relativeSalesRate,
                paramsRaw: recommended.paramsRaw,
                fashionOriginalSizes: recommended.fashionOriginalSizes,
                fashionSizes: recommended.fashionSizes,
                fashionColors: recommended.fashionColors,
                resizedImages: recommended.resizedImages
            )
        }
        DispatchQueue.main.async {
            self.recommendedProducts = products
        }
    }
}
