import SwiftUI

struct SettingsInputCodeView: View {
    
    @Binding var storeKey: String
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("settings_title")
                .font(.title)
                .font(.system(size: 24))
                .foregroundColor(.black)
            
            Text("settings_sub_title")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            VStack {
                TextField("store_key_hint", text: $storeKey)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(size: 16))
                    .frame(height: 55)
                
                Button(
                    action: {
                        // TODO Add uploading code click
                        print("Button tapped")
                    }
                ) {
                    Text("upload_button_title")
                        .foregroundColor(.white)
                        .padding()
                        .frame(height: 44)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Text("process_timeout_title")
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct SettingsInputCode_preview: PreviewProvider {
    static var previews: some View {
        SettingsInputCodeView(storeKey: .constant("Some key"))
    }
}
