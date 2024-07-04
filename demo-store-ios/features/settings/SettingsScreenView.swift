
import SwiftUI

struct SettingsScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("settings_tab_title")
                    .foregroundColor(.white)
            }
            .navigationTitle("settings_tab_title")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
