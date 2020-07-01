func addNumbers(_ numbers: String) -> Int {
  let seperators = CharacterSet(arrayLiteral: ",","\n")
  let separatedNumbers = numbers.components(separatedBy: seperators)
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
  
  func testOnePlusOnePlusOneIsThree() {
    let actual = addNumbers("1,1,1")
    let expected = 3
    XCTAssertEqual(actual, expected)
  }
  
  func testOneNewLineOneCommaOneIsThree() {
    let actual = addNumbers("1\n1,1")
    let expected = 3
    XCTAssertEqual(actual, expected)
  }
  
  func testOneProvidedDelimiterOneIsTwo() {
    let actual = addNumbers("//;\n1;1")
    let expected = 2
    XCTAssertEqual(actual, expected)
  }
}

Tests.defaultTestSuite.run()
