
import SwiftUI

struct MainScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Favourites Screen")
                    .foregroundColor(.white)
            }
            .navigationTitle("Favourites")
            .background(Color.black.edgesIgnoringSafeArea(.all)) 
        }
    }
}
