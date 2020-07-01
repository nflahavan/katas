func addNumbers(_ numbers: String) -> Int {
  let separatedNumbers = numbers.components(separatedBy: ",")
  return separatedNumbers.reduce(0) { $0 + (Int($1) ?? 0) }
}

import XCTest

class Tests: XCTestCase {
  func testEmptyStringIsZero() {
    let actual = addNumbers("")
    let expected = 0
    XCTAssertEqual(actual, expected)
  }
  
  func testOneIsOne() {
    let actual = addNumbers("1")
    let expected = 1
    XCTAssertEqual(actual, expected)
  }
  
  func testOnePlusOneIsTwo() {
    let actual = addNumbers("1,1")
    let expected = 2
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
