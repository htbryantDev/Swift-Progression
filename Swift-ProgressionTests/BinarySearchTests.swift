import XCTest
@testable import Swift_Progression

class BinarySearchTests: XCTestCase {
    
    var testArray: [Int] = []

    override func setUp() {
        testArray = [1, 2, 3, 4, 5]
    }

    func test_valueExists() {
        let result = BinarySearch.search(array: testArray, searchValue: 2)
        XCTAssertTrue(result.doesExist)
    }
    
    func test_valueDoesNotExist() {
        let result = BinarySearch.search(array: testArray, searchValue: 7)
        XCTAssertFalse(result.doesExist)
    }
    
    func test_withEmpty() {
        testArray = []
        let result = BinarySearch.search(array: testArray, searchValue: 1)
        XCTAssertFalse(result.doesExist)
    }
    
    func test_findsMiddleInOneIteration() {
        let result = BinarySearch.search(array: testArray, searchValue: 3)
        XCTAssertTrue(result.doesExist)
        XCTAssertEqual(result.iterations, 1)
    }
    
}
