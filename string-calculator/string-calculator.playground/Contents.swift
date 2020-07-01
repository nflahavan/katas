enum AddNumbersError: Error {
  case negativesNotAllowed([Int])
}

func addNumbers(_ numbers: String) throws -> Int {
  var seperators: CharacterSet
  let separatedNumbers: [String]
  
  if numbers.hasPrefix("//") {
    seperators = CharacterSet(charactersIn: String(numbers[numbers.index(numbers.startIndex, offsetBy: 2)]))
    separatedNumbers = numbers.dropFirst(4).components(separatedBy: seperators)
  } else {
    seperators = CharacterSet(arrayLiteral: ",","\n")
    separatedNumbers = numbers.components(separatedBy: seperators)
  }
  
  var validNums = [Int]()
  var invalidNums = [Int]()
  
  for number in separatedNumbers {
    let num = Int(number) ?? 0
    
    if num >= 0 {
      validNums.append(num)
    } else {
      invalidNums.append(num)
    }
  }
  
  guard invalidNums.isEmpty else { throw AddNumbersError.negativesNotAllowed(invalidNums) }
  
  return validNums.reduce(0, +)
}

import XCTest

class Tests: XCTestCase {
  func testEmptyStringIsZero() throws {
    let actual = try addNumbers("")
    let expected = 0
    XCTAssertEqual(actual, expected)
  }
  
  func testOneIsOne() throws {
    let actual = try addNumbers("1")
    let expected = 1
    XCTAssertEqual(actual, expected)
  }
  
  func testOnePlusOnePlusOneIsThree() throws {
    let actual = try addNumbers("1,1,1")
    let expected = 3
    XCTAssertEqual(actual, expected)
  }
  
  func testOneNewLineOneCommaOneIsThree() throws {
    let actual = try addNumbers("1\n1,1")
    let expected = 3
    XCTAssertEqual(actual, expected)
  }
  
  func testOneProvidedDelimiterOneIsTwo() throws {
    let actual = try addNumbers("//;\n1;1")
    let expected = 2
    XCTAssertEqual(actual, expected)
  }
  
  func testNegativeNumbersNotAllowed() {
    do {
      _ = try addNumbers("-7,-2")
      XCTFail("Error not thrown")
    } catch let AddNumbersError.negativesNotAllowed(actual) {
      let expected = [-7, -2]
      XCTAssertEqual(actual, expected)
    } catch {
      XCTFail("Wrong error thrown")
    }
  }
}

Tests.defaultTestSuite.run()
