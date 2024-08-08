import SwiftUI

struct SearchErrorView: View {
    let errorMessage: String
    
    var body: some View {
        Text(errorMessage)
            .foregroundColor(AppColors.colorRed)
            .padding()
    }
}
