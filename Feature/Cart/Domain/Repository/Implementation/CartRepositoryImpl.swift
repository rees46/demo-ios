import Foundation
import Combine

class CartRepositoryImpl: ObservableObject, CartRepository {
    
    @Published var cartItems: [ProductCartItem] = []

    var cartItemsPublisher: Published<[ProductCartItem]>.Publisher { $cartItems }

    func addToCart(product: RecommendedProduct, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += quantity
            #if DEBUG
            print("Updated \(product.name) quantity to \(cartItems[index].quantity). Price: \(product.priceFormatted ?? "")")
            #endif
        } else {
            let newItem = ProductCartItem(product: product, quantity: quantity)
            cartItems.append(newItem)
            #if DEBUG
            print("Added \(product.name) with quantity \(quantity). Price: \(product.priceFormatted ?? "")")
            #endif
        }
    }
    
    func updateCartItem(productId: String, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == productId }) {
            if quantity > 0 {
                cartItems[index].quantity = quantity
                #if DEBUG
                print("Updated \(cartItems[index].product.name) quantity to \(quantity). Price: \(cartItems[index].product.priceFormatted ?? "")")
                #endif
            } else {
                let removedProduct = cartItems.remove(at: index)
                #if DEBUG
                print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
                #endif
            }
        }
    }
    
    func removeFromCart(productId: String) {
        if let index = cartItems.firstIndex(where: { $0.product.id == productId }) {
            let removedProduct = cartItems.remove(at: index)
            #if DEBUG
            print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
            #endif
        }
    }
}
