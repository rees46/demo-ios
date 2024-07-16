
import SwiftUI

struct SettingsErrroScreenView: View {
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text("default_error_title")
                .font(.system(size: 32))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(Font.footnote.weight(.bold))
            
            Text("default_error_sub_title")
                .font(.system(size: 18))
                .padding(.vertical,20)
                .padding(.horizontal,16)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Button(action: retryAction) {
                Text("go_home_button")
                    .foregroundColor(.white)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
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
