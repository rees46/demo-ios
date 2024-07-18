import UIKit
import REES46

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let SHOP_ID = "357382bf66ac0ce2f1722677c59511"
    private let API_DOMAIN = "https://api.rees46.ru/"
    private let USER_EMAIL: String? = nil
    private let USER_PHONE: String? = nil
    private let USER_LOYALTY_ID: String? = nil
    private let SDK_STREAM = "ios"
    
    private let NOTIFICATION_TYPE = "DEMO NOTIFICATION TYPE"
    private let NOTIFICATION_ID = "DEMO NOTIFICATION ID"
    
    var sdk: PersonalizationSDK?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize SDK
        initializeSDK()
        
        return true
    }
    
    func initializeSDK() {
        sdk = createPersonalizationSDK(
            shopId: SHOP_ID,
            userEmail: USER_EMAIL,
            userPhone: USER_PHONE,
            userLoyaltyId: USER_LOYALTY_ID,
            apiDomain: API_DOMAIN,
            stream: SDK_STREAM,
            enableLogs: true,
            autoSendPushToken: true
        ) { error in
            if let error = error {
                print("SDK Initialization failed: \(error.localizedDescription)")
                // Handle the initialization failure appropriately
                // For example, retry initialization or show an error message
            } else {
                print("SDK Initialization succeeded")
                // SDK is initialized, you can access its session or perform other actions
                if let sessionId = self.sdk?.getSession() {
                    print("SDK Session ID: \(sessionId)")
                } else {
                    print("Failed to retrieve SDK session ID")
                }
            }
        }
    }
}
