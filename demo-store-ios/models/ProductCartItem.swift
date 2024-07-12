import Foundation

struct ProductCartItem: Identifiable, Hashable, Equatable {
    let product: RecommendedProduct
    var quantity: Int

    var id: String {
        product.id
    }

    static func == (lhs: ProductCartItem, rhs: ProductCartItem) -> Bool {
        return lhs.product.id == rhs.product.id && lhs.quantity == rhs.quantity
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(quantity)
    }
}
