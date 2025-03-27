import PersonaClick

class SDKManager: SDKManaging {
    var sdk: PersonalizationSDK?

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
            parentViewController: UIApplication.shared.windows.first?.rootViewController,
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
