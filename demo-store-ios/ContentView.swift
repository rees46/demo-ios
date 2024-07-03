import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            } else {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }
            Text("Hello, world!")
        }
        .padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
