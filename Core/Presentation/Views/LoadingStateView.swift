import SwiftUI

struct LoadingStateView<Content: View>: View {
    let isLoading: Bool
    let content: () -> Content
    
    var body: some View {
        Group {
            if isLoading {
                LoadingView(isLoading: .constant(true))
            } else {
                content()
            }
        }
    }
}
