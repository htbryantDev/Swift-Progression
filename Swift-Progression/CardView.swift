import UIKit

struct Card: Equatable {
    let name: String
    let color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }

    static func random() -> Card {
        .init(
            name: Constants.dogNames.randomElement()!,
            color: Constants.colors.randomElement()!
        )
    }
}

class CardView: UIView {
    
    private let label = UILabel()
    
    init(_ card: Card) {
        super.init(frame: .zero)
        
        layer.cornerRadius = 8
        
        setUpLabel()
        configure(card)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(_ card: Card) {
        label.text = card.name
        label.textColor = card.color == .white ? .black : .white
        backgroundColor = card.color
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = backgroundColor == .white ? .black : .white
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
