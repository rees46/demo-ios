import SwiftUI

struct TotalPriceSection: View {
    var totalPrice: Int
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Spacer().frame(height: 10)
            
            HStack {
                Spacer()
                Text("shipping_title")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                
                Text("Free")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
            
            HStack {
                Spacer()
                Text("total_title")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                
                Text("\(totalPrice)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
    }
}
