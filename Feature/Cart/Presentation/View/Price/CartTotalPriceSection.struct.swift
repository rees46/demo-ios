import SwiftUI

struct CartTotalPriceSection: View {
    var totalPrice: Int
    
    var body: some View {
        VStack(alignment: .trailing, spacing: Sizes.Spacing.medium) {
            Spacer().frame(height: Sizes.Spacing.medium)
            
            HStack {
                Spacer()
                Text("shipping_title")
                    .font(.system(size: Typography.FontSize.standard))
                    .foregroundColor(AppColors.colorBlack)
                    .padding(.trailing, Sizes.Padding.xLarge)
                
                Text("Free")
                    .font(.system(size: Typography.FontSize.standard, weight: .bold))
                    .foregroundColor(.black)
            }
            
            HStack {
                Spacer()
                Text("total_title")
                    .font(.system(size: Typography.FontSize.standard))
                    .foregroundColor(AppColors.colorBlack)
                    .padding(.trailing, Sizes.Padding.xLarge)
                
                Text("\(totalPrice)")
                    .font(.system(size: Typography.FontSize.standard, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
            }
        }
        .padding(.horizontal)
    }
}
