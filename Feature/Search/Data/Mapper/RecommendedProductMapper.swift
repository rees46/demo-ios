import Foundation
import PersonaClick

class RecommendedProductMapper {
    
    static func mapResponseToProducts(response: PersonaClick.RecommenderResponse) -> [RecommendedProduct] {
        return response.recommended.map { recommended in
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
                    ProductDto(
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
    }
}
