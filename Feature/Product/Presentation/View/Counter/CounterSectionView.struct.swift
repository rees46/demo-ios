import SwiftUI

struct CounterSectionView: View {
    @Binding var counter: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Button(
                action: {
                    if counter > 0 {
                        counter -= 1
                    }
                }
            ) {
                Text("-")
                    .font(.system(size: Typography.FontSize.xxLarge, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
                    .background(AppColors.colorWhite)
                    .frame(width: Sizes.Size.commonHeight, height: Sizes.Size.commonHeight)
            }
            
            Text("\(counter)")
                .font(.system(size: Typography.FontSize.xxLarge, weight: .bold))
                .foregroundColor(AppColors.colorBlack)
                .background(AppColors.colorWhite)
                .frame(width: Sizes.Size.commonHeight, height: Sizes.Size.commonHeight)
            
            Button(
                action: {
                    counter += 1
                }
            ) {
                Text("+")
                    .font(.system(size: Typography.FontSize.xxLarge, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
                    .background(AppColors.colorWhite)
                    .frame(width: Sizes.Size.commonHeight, height: Sizes.Size.commonHeight)
            }
        }
    }
}
