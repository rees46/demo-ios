import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var viewModel = MainTabViewModel()
    
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .onAppear {
                                // Simulate loading delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isLoading = false
                                }
                            }
                            .frame(height: 250)
                    } else {
                        MainDiscoverView()
                        
                        MainStoriesContainerView()
                        
                        ShortRecommendationListView(
                            recommendedProducts: viewModel.arrivalsProducts,
                            title: NSLocalizedString("arrivals_title", comment: "")
                        )
                        .onAppear {
                            viewModel.loadArrivalsRecommendations(currentProductId: "670")
                        }
                        
                        ShortRecommendationListView(
                            recommendedProducts: viewModel.topTrendProducts,
                            title: NSLocalizedString("top_trend_title", comment: "")
                        ).onAppear {
                            viewModel.loadTopTrendRecommendations(currentProductId: "656")
                        }
                        
                        ShortRecommendationListView(
                            recommendedProducts: viewModel.recommenderProducts,
                            title: NSLocalizedString("reccomender_title", comment: "")
                        ).onAppear {
                            viewModel.loadRecommenderRecommendations(currentProductId: "651")
                        }
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
