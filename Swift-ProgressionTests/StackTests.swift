import XCTest
@testable import Swift_Progression

class StackTestCase: XCTestCase {
    
    var stack = Stack<Int>()
    
    override func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }
    
    func test_push() {
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func test_pop() {
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.description, "1 2 3")
    }
    
    func test_peek() {
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func test_isEmpty() {
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_init_withArray() {
        let array = [1, 2, 3, 4]
        XCTAssertEqual(stack, Stack(array))
    }
    
    func test_init_no_elements() {
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_arrayLiteral() {
        let stack: Stack = ["blueberry", "plain", "potato"]
        XCTAssertEqual(stack, ["blueberry", "plain", "potato"])
    }
    
}
