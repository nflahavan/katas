func addNumbers(_ numbers: String) -> Int {
  return Int.min
}

import XCTest

class Tests: XCTestCase {
  func testEmptyStringIsZero() {
    let actual = addNumbers("")
    let expected = 0
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
