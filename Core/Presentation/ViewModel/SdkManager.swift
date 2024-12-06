import REES46

class SDKManager: SDKManaging {
    var sdk: PersonalizationSDK?
    let parentVC = UIApplication.topViewController()

    init() {
        initializeSDK()
    }

    private func initializeSDK() {
        sdk = createPersonalizationSDK(
            shopId: AppConfigVariables.shopId,
            apiDomain: AppConfigVariables.apiDomain,
            stream: AppConfigVariables.sdkStream,
            enableLogs: true,
            autoSendPushToken: true,
            parentViewController:parentVC,
            needReInitialization: true
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

import UIKit

extension UIApplication {
    static func topViewController(base: UIViewController? = UIApplication.shared.connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
