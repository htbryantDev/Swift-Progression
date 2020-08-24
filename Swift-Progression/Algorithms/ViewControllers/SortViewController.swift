import UIKit

class SortViewController: UIViewController {
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    private static let data = [15, 4, 42, 16, 23, 8]
    
    private let bubbleSortCardView: SortCardView = {
        SortCardView(
            title: "Bubble Sort",
            data: data,
            backgroundColor: .red,
            sortAction: Sort.bubble
        )
    }()
    
    private let selectionSortCardView: SortCardView = {
        SortCardView(
            title: "Selection Sort",
            data: data,
            backgroundColor: .orange,
            sortAction: Sort.selection
        )
    }()
    
    private let insertionSortCardView: SortCardView = {
        SortCardView(
            title: "Insertion Sort",
            data: data,
            backgroundColor: .purple,
            sortAction: Sort.insertion
        )
    }()
    
    private var spacerView: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Sort"
        setupContentStackView()
    }
    
    private func setupContentStackView() {
        contentStackView.constrainToEdges(parent: view)
        
        /* ISSUE: When invoking BubbleSort() then SelectionSort() or vice versa,
         the calculated time to complete for the second operation is not consistent.
         Need to find out what the cause is, for now one of the sort methods will not
         be displayed, in order to avoid confusion. */
        
//        contentStackView.addArrangedSubview(bubbleSortCardView)
        contentStackView.addArrangedSubview(selectionSortCardView)
        contentStackView.addArrangedSubview(insertionSortCardView)
        contentStackView.addArrangedSubview(spacerView)
    }
    
    private func makeTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }
    
    private func makeDetaiLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 16)
        return label
    }
    
}
