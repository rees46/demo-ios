import Foundation

struct SearchProduct: Identifiable {
    let id: String
    let barcode: String
    let name: String
    let brand: String
    let model: String
    let description: String
    let imageUrl: String
    let resizedImageUrl: String
    let resizedImages: [String: String]
    let url: String
    let deeplinkIos: String
    let price: Double
    let priceFormatted: String
    let priceFull: Double
    let priceFullFormatted: String
    let oldPrice: Double
    let oldPriceFormatted: String
    let oldPriceFull: Double
    let oldPriceFullFormatted: String
    let currency: String
    let salesRate: Int
    let discount: Int
    let relativeSalesRate: Float
    let isNew: Bool?
    let params: [[String: Any]]?
}
