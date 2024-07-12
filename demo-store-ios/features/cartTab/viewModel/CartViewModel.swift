import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cart: [ProductCartItem] = []
    
    func addToCart(product: RecommendedProduct, quantity: Int) {
        if let index = cart.firstIndex(where: { $0.product.id == product.id }) {
            cart[index].quantity += quantity
            let totalPrice = calculateTotalPrice(for: product.priceFormatted ?? "", quantity: cart[index].quantity)
            print("Updated \(product.name) quantity to \(cart[index].quantity). Total Price: \(totalPrice)")
        } else {
            let newItem = ProductCartItem(product: product, quantity: quantity)
            cart.append(newItem)
            let totalPrice = calculateTotalPrice(for: product.priceFormatted ?? "", quantity: quantity)
            print("Added \(product.name) with quantity \(quantity). Total Price: \(totalPrice)")
        }
    }
    
    func updateCartItem(productId: String, quantity: Int) {
        if let index = cart.firstIndex(where: { $0.product.id == productId }) {
            if quantity > 0 {
                cart[index].quantity = quantity
                let totalPrice = calculateTotalPrice(for: cart[index].product.priceFormatted ?? "", quantity: quantity)
                print("Updated \(cart[index].product.name) quantity to \(quantity). Total Price: \(totalPrice)")
            } else {
                let removedProduct = cart.remove(at: index)
                print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
            }
        }
    }
    
    func removeFromCart(productId: String) {
        if let index = cart.firstIndex(where: { $0.product.id == productId }) {
            let removedProduct = cart.remove(at: index)
            print("Removed \(removedProduct.product.name). Price: \(removedProduct.product.priceFormatted ?? "")")
        }
    }
    
    private func calculateTotalPrice(for priceString: String, quantity: Int) -> String {
        // Assuming the price string is in the format "$99.99"
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        if let priceNumber = numberFormatter.number(from: priceString)?.doubleValue {
            let totalPrice = priceNumber * Double(quantity)
            return numberFormatter.string(from: NSNumber(value: totalPrice)) ?? "N/A"
        }
        
        return "N/A"
    }
}
