import XCTest
@testable import Swift_Progression

class SortCardViewTests: XCTestCase {
    
    var sortCardView: SortCardView<Int>!
    var data: [Int]!

    override func setUp() {
        data = [15, 4, 42, 16, 23, 8]
        sortCardView = SortCardView(
            title: "sort",
            data: data,
            backgroundColor: .white,
            sortAction: Sort.insertion
        )
    }

    func test_sortAction() {
        sortCardView.button.sendActions(for: .touchUpInside)
        XCTAssertEqual(sortCardView.data, [4, 8, 15, 16, 23, 42])
    }

}
