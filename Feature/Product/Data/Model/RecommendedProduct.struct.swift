import Foundation
import PersonaClick

struct RecommendedProduct {
    let id: String
    let barcode: String
    let name: String
    let brand: String
    let model: String
    let description: String
    let imageUrl: String
    let resizedImageUrl: String
    let url: String
    let deeplinkIos: String
    let categories: [ProductDto]
    let locations: [PersonaClick.Location]
    let price: Double
    let priceFormatted: String?
    let priceFull: Double
    let priceFullFormatted: String?
    let oldPrice: Double
    let oldPriceFormatted: String?
    let oldPriceFull: Double
    let oldPriceFullFormatted: String?
    let currency: String
    let salesRate: Int
    let discount: Int
    let rating: Int
    let relativeSalesRate: Float
    let paramsRaw: [[String: Any]]?
    let fashionOriginalSizes: [String]
    let fashionSizes: [String]
    let fashionColors: [String]
    let resizedImages: [String: String]
}

extension RecommendedProduct {
    static func from(product: SearchProduct) -> RecommendedProduct {
        return RecommendedProduct(
            id: product.id,
            barcode: product.barcode,
            name: product.name,
            brand: product.brand,
            model: product.model,
            description: product.description,
            imageUrl: product.imageUrl,
            resizedImageUrl: product.resizedImageUrl,
            url: product.url,
            deeplinkIos: product.deeplinkIos,
            categories: [],
            locations: [],
            price: product.price,
            priceFormatted: product.priceFormatted,
            priceFull: product.priceFull,
            priceFullFormatted: product.priceFullFormatted,
            oldPrice: product.oldPrice,
            oldPriceFormatted: product.oldPriceFormatted,
            oldPriceFull: product.oldPriceFull,
            oldPriceFullFormatted: product.oldPriceFullFormatted,
            currency: product.currency,
            salesRate: product.salesRate,
            discount: product.discount,
            rating: Int(product.relativeSalesRate),
            relativeSalesRate: product.relativeSalesRate,
            paramsRaw: product.params,
            fashionOriginalSizes: [],
            fashionSizes: [],
            fashionColors: [],
            resizedImages: product.resizedImages
        )
    }
}
