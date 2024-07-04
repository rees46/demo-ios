import SwiftUI
import Combine

import SwiftUI

struct ContentView: View {
    @StateObject var tabSelection = TabSelection()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0) {
                ToolbarView(tabSelection: tabSelection)
                
                BottomBarView(tabSelection: tabSelection)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .statusBar(hidden: false)
    }
}

struct ToolbarView: View {
    @ObservedObject var tabSelection: TabSelection
    
    var body: some View {
        VStack {
            ZStack {
                Color.black
                Image("ToolbarLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            
            HStack(spacing: 20) {
                
                Image("MenuIcon")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                    .padding(.leading, 12)
                
                Spacer()
                
                Image("SearchIcon")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                
                Image("CartIcon")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
                    .onTapGesture {
                        tabSelection.selectedTabIndex = 2
                    }
            }
            .frame(height: 50)
        }
        .background(Color.white)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
