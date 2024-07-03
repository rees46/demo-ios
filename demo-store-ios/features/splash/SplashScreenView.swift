import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(width:150, height: 150)
                .foregroundColor(.white)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
