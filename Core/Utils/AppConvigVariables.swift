// Config.swift
import Foundation

struct AppConfigVariables {
    static let blockId: String = ProcessInfo.processInfo.environment["BLOCK_ID"] ?? ""
    static let shopId: String = ProcessInfo.processInfo.environment["SHOP_ID"] ?? ""
    static let apiDomain: String = ProcessInfo.processInfo.environment["API_DOMAIN_PATH"] ?? "api.rees46.ru"
    static let sdkStream: String = ProcessInfo.processInfo.environment["SDK_STREAM"] ?? "ios"
}
