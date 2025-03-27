import Foundation
import PersonaClick

struct SearchProductResponse {
    let categories: [SearchCategory]
    let products: [SearchProduct]
    let productsTotal: Int
    let queries: [SearchQuery]
    let filters: [String: SearchFilter]?
    let industrialFilters: SearchIndustrialFilters?
    let brands: [String]?
    let priceRange: SearchPriceRange?
    let redirect: SearchRedirect?
}
