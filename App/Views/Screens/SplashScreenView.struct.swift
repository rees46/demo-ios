import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            AppColors.colorBlack.edgesIgnoringSafeArea(.all)
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(
                    width: Sizes.Size.mediumImage,
                    height: Sizes.Size.mediumImage
                )
                .foregroundColor(AppColors.colorWhite)
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
