import Foundation

@objc(SecurityCheckModule)
class SecurityCheckModule: NSObject {

  @objc
  func getSecurityStatus(_ resolve: @escaping RCTPromiseResolveBlock,
                         rejecter reject: @escaping RCTPromiseRejectBlock) {
    let result: [String: Bool] = [
      "isVpnActive": SecurityCheckModule.isVPNActive(),
      "isJailBroken": SecurityCheckModule.isJailBroken(),
      "isDebugOrSimulator": SecurityCheckModule.isRunningInDebugOrSimulator()
    ]
    resolve(result)
  }

  static func isVPNActive() -> Bool {
    guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
          let scopes = settings["__SCOPED__"] as? [String: Any] else {
      return false
    }

    for key in scopes.keys {
      if key.contains("tap") ||
         key.contains("tun") ||
         key.contains("ppp") ||
         key.contains("ipsec") ||
         key.contains("utun") ||
         key.contains("vpn") {
        return true
      }
    }

    return false
  }

  static func isJailBroken() -> Bool {
    #if targetEnvironment(simulator)
      return false
    #else
      let paths = [
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/private/var/lib/apt/"
      ]

      for path in paths {
        if FileManager.default.fileExists(atPath: path) {
          return true
        }
      }

      let testPath = "/private/" + UUID().uuidString
      do {
        try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
        try FileManager.default.removeItem(atPath: testPath)
        return true
      } catch {
        return false
      }
    #endif
  }

  static func isRunningInDebugOrSimulator() -> Bool {
    #if targetEnvironment(simulator)
      return true
    #else
      return _isDebugAssertConfiguration()
    #endif
  }
}
