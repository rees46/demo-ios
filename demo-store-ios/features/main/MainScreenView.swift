import SwiftUI
import REES46

struct MainScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel = SDKViewModel()
    
    private let blockId = "977cb67194a72fdc7b424f49d69a862d"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    MainDiscoverView()
                    
                    MainStoriesContainerView()
                    
                    RecommendationListView(
                        recommendedProducts: viewModel.arrivalsProducts,
                        title: NSLocalizedString("arrivals_title", comment: "")
                    ).onAppear {
                        viewModel.loadArrivalsRecommendations(blockId: blockId, currentProductId: "646")
                    }
                    
                    RecommendationListView(
                        recommendedProducts: viewModel.topTrendProducts,
                        title: NSLocalizedString("top_trend_title", comment: "")
                    ).onAppear {
                        viewModel.loadTopTrendRecommendations(blockId: blockId, currentProductId: "649")
                    }
                    
                    RecommendationListView(
                        recommendedProducts: viewModel.recommenderProducts,
                        title: NSLocalizedString("reccomender_title", comment: "")
                    ).onAppear {
                        viewModel.loadRecommenderRecommendations(blockId: blockId, currentProductId: "641")
                    }
                    
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .top)
            }
            .navigationTitle("main_tab_title")
            .onAppear {
                navigationManager.setToolbarHidden(hidden: false)
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environmentObject(NavigationManager())
    }
}
