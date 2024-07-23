import REES46

protocol SDKManaging {
    var sdk: PersonalizationSDK? { get }
}

class SDKManager: SDKManaging {
    static let shared = SDKManager()
    
    var sdk: PersonalizationSDK?
    
    private init() {
        initializeSDK()
    }
    
    private let USER_EMAIL: String? = nil
    private let USER_PHONE: String? = nil
    private let USER_LOYALTY_ID: String? = nil
    private let NOTIFICATION_TYPE = "DEMO NOTIFICATION TYPE"
    private let NOTIFICATION_ID = "DEMO NOTIFICATION ID"

    private func initializeSDK() {
        sdk = createPersonalizationSDK(
            shopId: ProcessInfo.processInfo.environment["SHOP_ID"] ?? "",
            userEmail: USER_EMAIL,
            userPhone: USER_PHONE,
            userLoyaltyId: USER_LOYALTY_ID,
            apiDomain: ProcessInfo.processInfo.environment["API_DOMAIN_PATH"] ?? "api.rees46.ru",
            stream: ProcessInfo.processInfo.environment["SDK_STREAM"] ?? "ios",
            enableLogs: true,
            autoSendPushToken: true
        ) { error in
            if let error = error {
                print("SDK Initialization failed: \(error.localizedDescription)")
            } else {
                print("SDK Initialization succeeded")
                if let sessionId = self.sdk?.getSession() {
                    print("SDK Session ID: \(sessionId)")
                } else {
                    print("Failed to retrieve SDK session ID")
                }
            }
        }
    }
}
