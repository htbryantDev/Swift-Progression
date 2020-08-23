import UIKit

class SortViewController: UIViewController {
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Sort"
        
        setupContentStackView()
    }
    
    private func setupContentStackView() {
        contentStackView.constrainToEdges(parent: view)
        
        let bubbleSortCardView = SortCardView(
            title: "Bubble Sort",
            data: [15, 4, 42, 16, 23, 8],
            backgroundColor: .red,
            sortAction: Sort.bubble
        )
        contentStackView.addArrangedSubview(bubbleSortCardView)
        
        let selectionSortCardView = SortCardView(
            title: "Selection Sort",
            data: [15, 4, 42, 16, 23, 8],
            backgroundColor: .orange,
            sortAction: Sort.selection
        )
        
        contentStackView.addArrangedSubview(selectionSortCardView)
        
        let insertionSortCardView = SortCardView(
            title: "Insertion Sort",
            data: [15, 4, 42, 16, 23, 8],
            backgroundColor: .purple,
            sortAction: Sort.insertion
        )
        
        contentStackView.addArrangedSubview(insertionSortCardView)
        
        let spacerView = UIView()
        spacerView.setContentCompressionResistancePriority(.required, for: .vertical)
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
