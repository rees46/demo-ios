import SwiftUI

struct RemoveButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(AppColors.colorWhite)
                .frame(width: Sizes.Size.smallIconSize, height: Sizes.Size.smallIconSize)
                .background(AppColors.colorGray)
                .clipShape(Circle())
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}
