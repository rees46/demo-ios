import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(width: Sizes.Size.mediumImage, height: Sizes.Size.mediumImage)
                .foregroundColor(AppColors.foregroundColor)
        }
        .onAppear {
            Timer.after {
                withAnimation {
                    appState.showSplash = false
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .environmentObject(AppState())
    }
}
