import SwiftUI

struct SearchResultInfoView: View {
    var count: Int
    
    var body: some View {
        HStack {
            Text("search_found_title")
                .font(.system(size: Typography.FontSize.medium))
                .foregroundColor(AppColors.colorBlack)
            
            Text(String(format: NSLocalizedString("search_count_result", comment: ""), "\(count)"))
                .font(.system(size: Typography.FontSize.medium))
                .foregroundColor(AppColors.colorGray)
        }
        .padding(.vertical, Sizes.Padding.medium)
        .background(AppColors.colorWhite)
        .padding(.horizontal)
    }
}
