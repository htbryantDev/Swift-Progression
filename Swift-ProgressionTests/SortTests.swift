import XCTest
@testable import Swift_Progression

final class SortingTestCase: XCTestCase {
  var testArray: [Int] = []
  let sortedArray = [3, 4, 9, 10]
  
  override func setUp() {
    testArray = [9, 4, 10, 3]
  }
  
  func test_bubbleSort() {
    let _ = Sort.bubble(&testArray)
    XCTAssertEqual(testArray, sortedArray)
  }
  
  func test_selectionSort() {
    let _ = Sort.selection(&testArray)
    XCTAssertEqual(testArray, sortedArray)
  }
  
  func test_insertionSort() {
    let _ = Sort.insertion(&testArray)
    XCTAssertEqual(testArray, sortedArray)
  }
}
