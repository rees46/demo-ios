import Foundation
import Combine

class CartRepository: ObservableObject {
    
    static let shared = CartRepository()
    
    private init() {}
    
    @Published var cartItems: [ProductCartItem] = []
    
    func addToCart(product: RecommendedProduct, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += quantity
            print("Updated \(product.name) quantity to \(cartItems[index].quantity). Price: \(product.priceFormatted ?? "")")
        } else {
            let newItem = ProductCartItem(product: product, quantity: quantity)
            cartItems.append(newItem)
            print("Added \(product.name) with quantity \(quantity). Price: \(product.priceFormatted ?? "")")
        }
    }
    
    func updateCartItem(productId: String, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == productId }) {
            if quantity > 0 {
                cartItems[index].quantity = quantity
                print("Updated \(cartItems[index].product.name) quantity to \(quantity). Price: \(cartItems[index].product.priceFormatted ?? "")")
            } else {
                let removedProduct = cartItems.remove(at: index)
                print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
            }
        }
    }
    
    func removeFromCart(productId: String) {
        if let index = cartItems.firstIndex(where: { $0.product.id == productId }) {
            let removedProduct = cartItems.remove(at: index)
            print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
        }
    }
}
