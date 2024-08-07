import Foundation

extension Timer {
    static func after(_ delay: TimeInterval = 2, _ closure: @escaping () -> Void) {
        Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            closure()
        }
    }
}
