import SwiftUI
import Resolver

struct SearchHistoryView: View {
    
    @Binding var localSearchText: String
    @Injected var viewModel: SearchViewModel
    
    var body: some View {
        if !viewModel.searchHistory.isEmpty {
            VStack(alignment: .leading) {
                Divider().background(AppColors.colorGray)
                
                Text("search_history_title")
                    .font(.system(size: Typography.FontSize.small))
                    .padding(.horizontal)
                    .foregroundColor(AppColors.colorGray)
                
                ForEach(viewModel.searchHistory, id: \.self) { query in
                    Text(query)
                        .font(.system(size: Typography.FontSize.medium))
                        .padding(.horizontal)
                        .padding(.vertical, Sizes.Padding.medium)
                        .foregroundColor(AppColors.colorBlack)
                        .onTapGesture {
                            localSearchText = query
                            viewModel.searchText = query
                        }
                }
                
                Divider().background(AppColors.colorGray)
            }
        }
    }
}
