enum DoorState {
  case open
  case closed
}

func doorStatesAfter100Passes() -> [DoorState] {
  var doorState = Array(repeating: DoorState.open, count: 2)
  doorState[1] = .closed
  return doorState
}

import XCTest

class Tests: XCTestCase {
  func testDoorOneIsOpen() {
    let actual = doorStatesAfter100Passes().first
    let expected = DoorState.open
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorTwoIsClosed() {
    let actual = doorStatesAfter100Passes()[1]
    let expected = DoorState.closed
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorFourIsOpen() {
    let actual = doorStatesAfter100Passes()[3]
    let expected = DoorState.open
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
