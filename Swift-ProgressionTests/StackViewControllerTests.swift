import XCTest
@testable import Swift_Progression

class StackViewControllerTests: XCTestCase {
    
    var stackViewController: StackViewController!
    var stack: Stack<Card>!

    override func setUp() {
        stack = Stack([
            Card(name: "1", color: .red),
            Card(name: "2", color: .yellow),
            Card(name: "3", color: .blue),
        ])
        stackViewController = StackViewController(stack: stack)
        stackViewController.viewDidLoad()
    }
    
    func test_push() {
        stackViewController.pushButton.sendActions(for: .touchUpInside)
        XCTAssertNotEqual(stackViewController.stack.peek(), stack.peek())
    }
    
    func test_pop() {
        stackViewController.popButton.sendActions(for: .touchUpInside)
        XCTAssertNotEqual(stackViewController.stack.peek(), stack.peek())
    }
}
