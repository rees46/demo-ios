
import SwiftUI

struct SettingsErrroScreenView: View {
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text("default_error_title")
                .font(.system(size: Typography.FontSize.enormous))
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.colorBlack)
                .font(Font.footnote.weight(.bold))
            
            Text("default_error_sub_title")
                .font(.system(size: Typography.FontSize.extraLarge))
                .padding(.vertical,Sizes.Spacing.large)
                .padding(.horizontal,Sizes.Spacing.standard)
                .multilineTextAlignment(.center)
                .foregroundColor(AppColors.colorBlack)
            
            Button(action: retryAction) {
                Text("go_home_button")
                    .foregroundColor(AppColors.colorWhite)
                    .frame(height: Sizes.Size.textFrameWidth)
                    .frame(maxWidth: .infinity)
                    .background(AppColors.colorBlack)
                    .cornerRadius(Sizes.CornerRadius.large)
            }
            .padding(.horizontal)
        }
    }
}

struct SettingsInputCodeError_preview: PreviewProvider {
    static var previews: some View {
        SettingsErrroScreenView(){
            
        }
    }
}
