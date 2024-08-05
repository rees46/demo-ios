import SwiftUI

struct LoadingView: View {
    
    @Binding var isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear {
                    Timer.scheduledTimer(
                        withTimeInterval: 2.0,
                        repeats: false
                    ) { _ in
                        isLoading = false
                    }
                }
                .frame(height: Sizes.Size.largeImageSize)
        }
    }
}
