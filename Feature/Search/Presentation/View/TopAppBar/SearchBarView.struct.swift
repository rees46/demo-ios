import SwiftUI
import Resolver

struct SearchBarView: View {
    
    @Binding var localSearchText: String
    var onClearSearch: () -> Void
    var onNavigateBack: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                TextField("search_hint", text: $localSearchText)
                    .padding(.leading, Sizes.Padding.large)
                    .padding(.trailing, Sizes.Padding.extraLarge)
                    .frame(height: Sizes.Size.searchButtonHeight)
                    .background(Color(.systemGray6))
                    .cornerRadius(Sizes.CornerRadius.medium)
                    .overlay(
                        RoundedRectangle(cornerRadius: Sizes.CornerRadius.medium).stroke(
                            AppColors.colorGray.opacity(0.5),
                            lineWidth: Sizes.BorderWidth.standard
                        )
                    )
                
                if !localSearchText.isEmpty {
                    HStack {
                        Spacer()
                        Button(action: {onClearSearch()}) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(AppColors.colorGray)
                        }
                        .padding(.trailing, Sizes.Padding.large)
                    }
                }
            }
            
            Button(action: {onNavigateBack()}) {
                Image(systemName: "xmark")
                    .foregroundColor(AppColors.colorBlack)
            }
            .padding(.leading, Sizes.Padding.large)
        }
        .padding()
    }
}
