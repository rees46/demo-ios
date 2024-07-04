
import SwiftUI

struct SettingsScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Set Screen")
                    .foregroundColor(.white)
            }
            .navigationTitle("Favourites")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
