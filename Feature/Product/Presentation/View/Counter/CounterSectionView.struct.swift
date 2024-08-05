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
                    .font(.system(size: Sizes.FontSize.xxLarge, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
                    .background(AppColors.colorWhite)
                    .frame(width: Sizes.Size.buttonHeight, height: Sizes.Size.buttonHeight)
            }
            
            Text("\(counter)")
                .font(.system(size: Sizes.FontSize.xxLarge, weight: .bold))
                .foregroundColor(AppColors.colorBlack)
                .background(AppColors.colorWhite)
                .frame(width: Sizes.Size.buttonHeight, height: Sizes.Size.buttonHeight)
            
            Button(
                action: {
                    counter += 1
                }
            ) {
                Text("+")
                    .font(.system(size: Sizes.FontSize.xxLarge, weight: .bold))
                    .foregroundColor(AppColors.colorBlack)
                    .background(AppColors.colorWhite)
                    .frame(width: Sizes.Size.buttonHeight, height: Sizes.Size.buttonHeight)
            }
        }
    }
}
