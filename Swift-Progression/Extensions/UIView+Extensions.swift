import UIKit

extension UIView {
    func constrainToEdges(parent: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }
}
