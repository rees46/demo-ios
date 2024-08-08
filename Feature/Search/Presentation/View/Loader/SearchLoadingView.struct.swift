import SwiftUI

struct SearchLoadingView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ProgressView().frame(
                    width: Sizes.Size.icon,
                    height: Sizes.Size.icon
                )
                Spacer()
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height
            )
        }
    }
}
