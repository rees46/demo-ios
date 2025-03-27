import Foundation
import PersonaClick

extension SearchProductResponse {
    static func from(_ response: SearchResponse) -> SearchProductResponse {
        return SearchProductResponse(
            categories: response.categories.map { category in
                SearchCategory(
                    id: category.id,
                    name: category.name,
                    url: category.url,
                    alias: category.alias,
                    parentId: category.parentId
                )
            },
            products: response.products.map { product in
                SearchProduct(
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
                SearchQuery(
                    name: query.name,
                    url: query.url,
                    deeplinkIos: query.deeplinkIos
                )
            },
            filters: response.filters?.mapValues { filter in
                SearchFilter(
                    count: filter.count,
                    values: filter.values
                )
            },
            industrialFilters: response.industrialFilters.map { filters in
                SearchIndustrialFilters(
                    fashionSizes: filters.fashionSizes.map { size in
                        SearchFashionSize(
                            count: size.count,
                            size: size.size
                        )
                    },
                    fashionColors: filters.fashionColors.map { color in
                        SearchFashionColor(
                            count: color.count,
                            color: color.color
                        )
                    }
                )
            },
            brands: response.brands,
            priceRange: response.priceRange.map { range in
                SearchPriceRange(
                    min: range.min,
                    max: range.max
                )
            },
            redirect: response.redirect.map { redirect in
                SearchRedirect(
                    query: redirect.query,
                    redirectUrl: redirect.redirectUrl,
                    deeplink: redirect.deeplink,
                    deeplinkIos: redirect.deeplinkIos
                )
            }
        )
    }
}
