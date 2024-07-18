import Foundation
import REES46

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
    let locations: [REES46.Location]
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

