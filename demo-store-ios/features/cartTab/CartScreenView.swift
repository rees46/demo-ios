
import SwiftUI

struct CartScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("cart_tab_title")
                    .foregroundColor(.white)
            }
            .navigationTitle("cart_tab_title")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
