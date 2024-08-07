import SwiftUI

struct SectionHeaderView: View {
    let title: String
    let buttonAction: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: buttonAction) {
                HStack {
                    Text("show_all_button")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(
            title: "Section Title",
            buttonAction: {
                print("Show All tapped")
            }
        )
    }
}
