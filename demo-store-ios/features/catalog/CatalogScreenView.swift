
import SwiftUI

struct CatalogScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cat Screen")
                    .foregroundColor(.white)
            }
            .navigationTitle("Favourites")
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
