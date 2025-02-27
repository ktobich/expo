// Copyright 2022-present 650 Industries. All rights reserved.

import Security
import ExpoModulesCore

public class RandomModule: Module {
  public func definition() -> ModuleDefinition {
    name("ExpoRandom")

    function("getRandomBase64StringAsync", getRandomBase64String)

    function("getRandomBase64String", getRandomBase64String)
      .runSynchronously()
  }
}

private func getRandomBase64String(length: Int) throws -> String {
  var bytes = [UInt8](repeating: 0, count: length)
  let status = SecRandomCopyBytes(kSecRandomDefault, length, &bytes)

  guard status == errSecSuccess else {
    throw FailedGeneratingRandomBytesException(status)
  }
  return Data(bytes).base64EncodedString()
}

private class FailedGeneratingRandomBytesException: GenericException<OSStatus> {
  override var reason: String {
    "Generating random bytes has failed with OSStatus code: \(params)"
  }
}
