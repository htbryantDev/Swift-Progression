import UIKit

class HomeViewController: UITableViewController {
    
    private let sections: [Section] = [
        .init(
            title: "Data Structures",
            items: [
                Section.Item(
                    name: "Stack",
                    viewController: StackViewController(
                        stack: [
                            Card.random(),
                            Card.random(),
                            Card.random()
                        ]
                    )
                ),
            ]
        ),
        .init(
            title: "Algorithms",
            items: [
                Section.Item(name: "Sort", viewController: SortViewController()),
                Section.Item(name: "Binary Search", viewController: BinarySearchViewController())
            ]
        )
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
}


// MARK: DataSource Methods
extension HomeViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row].name
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
}

// MARK: Delegate Methods
extension HomeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = sections[indexPath.section].items[indexPath.row].viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController {
    private struct Section {
        let title: String
        let items: [Item]
        
        struct Item {
            let name: String
            let viewController: UIViewController
        }
    }
}
