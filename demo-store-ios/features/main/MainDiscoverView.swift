import SwiftUI

struct MainDiscoverView: View {
    var body: some View {
        VStack {
            Text("main_tab_title")
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<10) { index in
                        VStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 140, height: 180)
                                .cornerRadius(8)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 4) {
                                        Spacer()
                                        Text("Title")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                        HStack {
                                            Text("Subtitle 1")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white)
                                            Text("Subtitle 2")
                                                .font(.system(size: 12))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(8)
                                    .cornerRadius(8)
                                )
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .frame(height: 180)
        }
    }
}

struct MainDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        MainDiscoverView()
    }
}
