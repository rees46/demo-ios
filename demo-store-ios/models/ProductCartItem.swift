import Foundation

struct ProductCartItem: Identifiable {
    var id: String { product.id }
    let product: RecommendedProduct
    var quantity: Int
}
