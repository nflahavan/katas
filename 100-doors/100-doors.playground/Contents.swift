enum DoorState {
  case open
  case closed
}

func doorStatesAfter100Passes() -> [DoorState] {
  return Array(repeating: DoorState.closed, count: 100)
}

import XCTest

class Tests: XCTestCase {
  func testDoorOneIsOpen() {
    let actual = doorStatesAfter100Passes().first
    let expected = DoorState.open
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorTwoIsClosed() {
    let actual = doorStatesAfter100Passes()[2]
    let expected = DoorState.closed
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
