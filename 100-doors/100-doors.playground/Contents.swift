enum DoorState {
  case open
  case closed
}

func doorStateAfterNPasses(_ n: Int) -> [DoorState] {
  return Array(repeating: DoorState.closed, count: 100)
}

import XCTest

class Tests: XCTestCase {
  func testZeroPassesTogglesNoDoors() {
    let actual = doorStateAfterNPasses(0)
    let expected = Array(repeating: DoorState.closed, count: 100)
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
