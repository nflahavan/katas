enum DoorState {
  case open
  case closed
  
  mutating func toggle() {
    switch self {
    case .open: self = .closed
    case .closed: self = .open
    }
  }
}

func doorStatesAfter100Passes() -> [DoorState] {
  var doorState = Array(repeating: DoorState.open, count: 100)
  
  for visit in 2...100 {
    var currVisit = visit
    repeat {
      doorState[currVisit - 1].toggle()
      currVisit *= visit
    } while currVisit <= 100
  }
  
  return doorState
}

import XCTest

class Tests: XCTestCase {
  func testDoorOneIsOpen() {
    let state = doorStatesAfter100Passes()
    guard !state.isEmpty else { XCTFail(); return }
    
    let actual = state[0]
    let expected = DoorState.open
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorTwoIsClosed() {
    let state = doorStatesAfter100Passes()
    guard state.count > 1 else { XCTFail(); return }
    
    let actual = doorStatesAfter100Passes()[1]
    let expected = DoorState.closed
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorThreeIsClosed() {
    let state = doorStatesAfter100Passes()
    guard state.count > 2 else { XCTFail(); return }
    
    let actual = state[2]
    let expected = DoorState.closed
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoorFourIsOpen() {
    let state = doorStatesAfter100Passes()
    guard state.count > 3 else { XCTFail(); return }
    
    let actual = state[3]
    let expected = DoorState.open
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoor17IsClosed() {
    let state = doorStatesAfter100Passes()
    guard state.count > 16 else { XCTFail(); return }
    
    let actual = state[16]
    let expected = DoorState.closed
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoor100IsOpen() {
    let state = doorStatesAfter100Passes()
    guard state.count > 99 else { XCTFail(); return }
    
    let actual = state[99]
    let expected = DoorState.open
    
    XCTAssertEqual(actual, expected)
  }
  
  func testDoor100IsLast() {
    let actual = doorStatesAfter100Passes().count
    let expected = 100
    
    XCTAssertEqual(actual, expected)
  }
}
  

Tests.defaultTestSuite.run()
