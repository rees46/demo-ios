import Foundation

struct AppConfigVariables {
    static let blockId: String = ProcessInfo.processInfo.environment["BLOCK_ID"] ?? ""
    static let shopId: String = ProcessInfo.processInfo.environment["SHOP_ID"] ?? ""
    static let apiDomain: String = ProcessInfo.processInfo.environment["API_DOMAIN_PATH"] ?? "api.rees46.ru"
    static let sdkStream: String = ProcessInfo.processInfo.environment["SDK_STREAM"] ?? "ios"
    static let arrivalsCode: String = ProcessInfo.processInfo.environment["ARRIVALS_CODE"] ?? ""
    static let topTrendsCode: String = ProcessInfo.processInfo.environment["TOP_TRENDS_CODE"] ?? ""
    static let recommendationCode: String = ProcessInfo.processInfo.environment["RECOMMENDATION_CODE"] ?? ""
    static let inAppNotificationImageUrl: String = ProcessInfo.processInfo.environment["IN_APP_NOTIFICATION_IMAGE_URL"] ?? ""
}
