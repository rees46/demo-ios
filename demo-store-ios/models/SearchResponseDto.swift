import Foundation
import REES46

struct LocalFilter {
    let count: Int
    let values: [String: Int]
}

struct LocalIndustrialFilters {
    let fashionSizes: [LocalFashionSize]
    let fashionColors: [LocalFashionColor]
}

struct LocalFashionSize {
    let count: Int
    let size: String
}

struct LocalFashionColor {
    let count: Int
    let color: String
}

struct LocalPriceRange {
    let min: Double
    let max: Double
}

struct LocalSuggest {
    let name: String
    let url: String
    let deeplinkIos: String
}

struct LocalQuery {
    let name: String
    let url: String
    let deeplinkIos: String
}

struct LocalCategory {
    let id: String
    let name: String
    let url: String?
    let alias: String?
    let parentId: String?
}

struct LocalRedirect {
    let query: String
    let redirectUrl: String
    let deeplink: String?
    let deeplinkIos: String?
}

struct LocalSearchResponse {
    let categories: [LocalCategory]
    let products: [LocalProduct]
    let productsTotal: Int
    let queries: [LocalQuery]
    let filters: [String: LocalFilter]?
    let industrialFilters: LocalIndustrialFilters?
    let brands: [String]?
    let priceRange: LocalPriceRange?
    let redirect: LocalRedirect?
}

struct LocalProduct: Identifiable {
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

extension LocalSearchResponse {
    static func from(_ response: SearchResponse) -> LocalSearchResponse {
        return LocalSearchResponse(
            categories: response.categories.map { category in
                LocalCategory(
                    id: category.id,
                    name: category.name,
                    url: category.url,
                    alias: category.alias,
                    parentId: category.parentId
                )
            },
            products: response.products.map { product in
                LocalProduct(
                    id: product.id,
                    barcode: product.barcode,
                    name: product.name,
                    brand: product.brand,
                    model: product.model,
                    description: product.description,
                    imageUrl: product.imageUrl,
                    resizedImageUrl: product.resizedImageUrl,
                    resizedImages: product.resizedImages,
                    url: product.url,
                    deeplinkIos: product.deeplinkIos,
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
                    relativeSalesRate: product.relativeSalesRate,
                    isNew: product.isNew,
                    params: product.params
                )
            },
            productsTotal: response.productsTotal,
            queries: response.queries.map { query in
                LocalQuery(
                    name: query.name,
                    url: query.url,
                    deeplinkIos: query.deeplinkIos
                )
            },
            filters: response.filters?.mapValues { filter in
                LocalFilter(
                    count: filter.count,
                    values: filter.values
                )
            },
            industrialFilters: response.industrialFilters.map { filters in
                LocalIndustrialFilters(
                    fashionSizes: filters.fashionSizes.map { size in
                        LocalFashionSize(
                            count: size.count,
                            size: size.size
                        )
                    },
                    fashionColors: filters.fashionColors.map { color in
                        LocalFashionColor(
                            count: color.count,
                            color: color.color
                        )
                    }
                )
            },
            brands: response.brands,
            priceRange: response.priceRange.map { range in
                LocalPriceRange(
                    min: range.min,
                    max: range.max
                )
            },
            redirect: response.redirect.map { redirect in
                LocalRedirect(
                    query: redirect.query,
                    redirectUrl: redirect.redirectUrl,
                    deeplink: redirect.deeplink,
                    deeplinkIos: redirect.deeplinkIos
                )
            }
        )
    }
}
