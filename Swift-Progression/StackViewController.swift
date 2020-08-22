import UIKit

class StackViewController: UIViewController {
    
    private(set) var stack: Stack<Card>
    
    init(stack: Stack<Card>) {
        self.stack = stack
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let actionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private(set) var popButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pop", for: .normal)
        button.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        return button
    }()
    
    private(set) var pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return button
    }()
    
    private let defaultCard = Card(name: "Empty Stack!", color: .white)
    private lazy var cardView: CardView = CardView(defaultCard)
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Stack"
        
        setUpContentStackView()
        showCard()
    }
    
    private func setUpContentStackView() {
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        contentStackView.addArrangedSubview(cardView)
        contentStackView.addArrangedSubview(actionsStackView)
        
        actionsStackView.addArrangedSubview(pushButton)
        actionsStackView.addArrangedSubview(popButton)
    }
    
    private func showCard() {
        setPopButtonState()
        cardView.configure(stack.peek() ?? defaultCard)
    }
    
    private func setPopButtonState() {
        popButton.isEnabled = stack.peek() != nil
    }
    
    @objc
    private func pushAction() {
        stack.push(Card.random())
        setPopButtonState()
        
        cardView.configure(stack.peek() ?? defaultCard)
    }
    
    @objc
    private func popAction() {
        stack.pop()
        setPopButtonState()
        cardView.configure(stack.peek() ?? defaultCard)
    }
}
