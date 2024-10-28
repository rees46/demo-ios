import SwiftUI
import Foundation
import Resolver

extension HomeScreenView: ScreenTypeProvider {
    static var screenType: RootScreenType {
        .home
    }
}

struct HomeScreenView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @Injected var viewModel: HomeViewModel
    
    @State private var isLoading = true
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else {
                    
                    ListDiscoverProductsView()
                    
                    HomeStoriesContainerView()
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.arrivalsProducts,
                        title: NSLocalizedString("arrivals_title", comment: "")
                    )
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.topTrendProducts,
                        title: NSLocalizedString("top_trend_title", comment: "")
                    )
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.recommenderProducts,
                        title: NSLocalizedString("reccomender_title", comment: "")
                    )
                    Text("new_features_title")
                        .font(.headline)
                        .foregroundColor(AppColors.colorBlue)
                        .padding()
                        .frame(height: Sizes.Size.mediumImage)
                        .onTapGesture {
                            navigationManager.navigateToScreen(InAppNotificationScreen())
                        }
                }
            }
            .padding(.vertical, Sizes.Padding.standard)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .navigationTitle("main_tab_title")
        .onAppear {
            viewModel.loadAllRecommendations()
        }
    }
}
