import SwiftUI

struct SettingsScreenView: View {
    @State private var username: String = ""
    
    var body: some View {
        NavigationView {
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
                    TextField("store_key_hint", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 16))
                        .frame(height: 55)
//                        .padding(.horizontal)
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                        print("Button tapped")
                    }) {
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
            .navigationTitle("settings_tab_title")
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
