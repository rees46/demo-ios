
import SwiftUI

struct CartScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cart Screen")
                    .foregroundColor(.white)
            }
            .navigationTitle("Favourites")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
