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
            VStack(spacing: 16) {
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else {
                    
                    ListDiscoverProductsView()
                    
                    HomeStoriesContainerView()
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.arrivalsProducts,
                        title: NSLocalizedString("arrivals_title", comment: "")
                    ).onAppear {
                        viewModel.loadArrivalsRecommendations(currentProductId: AppConfigVariables.arrivalsCode)
                    }
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.topTrendProducts,
                        title: NSLocalizedString("top_trend_title", comment: "")
                    ).onAppear {
                        viewModel.loadTopTrendRecommendations(currentProductId: AppConfigVariables.topTrendsCode)
                    }
                    
                    ShortRecommendationListView(
                        recommendedProducts: viewModel.recommenderProducts,
                        title: NSLocalizedString("reccomender_title", comment: "")
                    ).onAppear {
                        viewModel.loadRecommenderRecommendations(currentProductId: AppConfigVariables.recommendationCode)
                    }
                    
                }
            }
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .navigationTitle("main_tab_title")
        .onAppear {
            navigationManager.setVisibility(hideToolbar: false, hideBottomBar: false)
        }
    }
}
