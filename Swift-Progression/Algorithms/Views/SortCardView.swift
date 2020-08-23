import UIKit

class SortCardView<T: Comparable>: UIView {
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let durationLabel = UILabel()
    private let button = UIButton(type: .system)
    private var sortAction: ((inout [T]) -> Double?)?
    private var data: [T]
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    init(title: String, data: [T], backgroundColor: UIColor, sortAction: @escaping (inout [T]) -> Double?) {
        self.data = data
        self.sortAction = sortAction
        
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 10
        
        configureLabel(titleLabel, title: title, font: .boldSystemFont(ofSize: 18))
        configureLabel(detailLabel, title: "\(data)", font: .systemFont(ofSize: 16))
        setUpButton()
        setUpContentStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpContentStackView() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.constrainToEdges(parent: self)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(detailLabel)
        contentStackView.addArrangedSubview(button)
        contentStackView.addArrangedSubview(durationLabel)
    }
    
    private func configureLabel(_ label: UILabel, title: String, font: UIFont) {
        label.text = title
        label.font = font
        label.textColor = .white
    }
    
    private func setUpButton() {
        button.setTitle("Sort", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.init(white: 1, alpha: 0.5), for: .disabled)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    func buttonAction() {
        guard let duration = sortAction?(&data) else { return }
        durationLabel.numberOfLines = 2
        configureLabel(durationLabel, title: "Speed: \(duration) seconds", font: .systemFont(ofSize: 16))
        configureLabel(detailLabel, title: "\(data)", font: .systemFont(ofSize: 16))
        detailLabel.textColor = .green
        button.isEnabled = false
    }
    
}
