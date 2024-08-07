import Foundation
import Combine

protocol CartRepository {
    var cartItemsPublisher: Published<[ProductCartItem]>.Publisher { get }
    func addToCart(product: RecommendedProduct, quantity: Int)
    func updateCartItem(productId: String, quantity: Int)
    func removeFromCart(productId: String)
}
