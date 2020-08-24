import UIKit

class BinarySearchViewController: UIViewController {
    
    private let searchValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Value to Search"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setContentHuggingPriority(.required, for: .vertical)
        return textField
    }()
    
    private let searchRangeMinTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Min Range"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setContentHuggingPriority(.required, for: .vertical)
        return textField
    }()
    
    private let searchRangeMaxTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Max Range"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setContentHuggingPriority(.required, for: .vertical)
        return textField
    }()
    
    private let rangeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let outputLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Output"
        return label
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private let searchRangeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        return stackView
    }()
    
    private var spacerView: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private var searchValue: Int?
    private var dataRange: [Int]?
    private var minRangeValue: Int = 0
    private var maxRangeValue: Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Binary Search"
        view.backgroundColor = .white
        searchRangeMaxTextField.delegate = self
        searchRangeMinTextField.delegate = self
        searchValueTextField.delegate = self
        
        contentStackView.constrainToEdges(parent: view)
        setUpSearchRangeStackView()
        setUpContentStackView()
        configureRangeValueLabel(min: minRangeValue, max: maxRangeValue)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    private func setUpSearchRangeStackView() {
        searchRangeStackView.addArrangedSubview(searchRangeMinTextField)
        searchRangeStackView.addArrangedSubview(searchRangeMaxTextField)
    }
    
    private func setUpContentStackView() {
        contentStackView.addArrangedSubview(spacerView)
        contentStackView.addArrangedSubview(rangeValueLabel)
        contentStackView.addArrangedSubview(spacerView)
        contentStackView.addArrangedSubview(searchRangeStackView)
        contentStackView.addArrangedSubview(searchValueTextField)
        contentStackView.addArrangedSubview(searchButton)
        contentStackView.addArrangedSubview(outputLabel)
        contentStackView.addArrangedSubview(spacerView)
    }
    
    private func configureRangeValueLabel(min: Int, max: Int) {
        rangeValueLabel.text = "Search Range\n\n\(min) - \(max)"
    }
    
    private func performBinarySearch(dataRange: [Int]) -> String? {
        guard let searchValueText = searchValueTextField.text, let searchValue = Int(searchValueText) else {
            showAlert(title: "Invalid Entry", message: "Please enter a NUMBER")
            return nil
        }
        
        let search = BinarySearch.search(array: dataRange, searchValue: searchValue)
        let text = "\(searchValue) in range: \(search.doesExist) | \(search.iterations) iterations"
        return text
    }
    
    @objc
    private func buttonAction() {
        setRange(min: minRangeValue, max: maxRangeValue)
        guard let dataRange = dataRange else { return }
        
        dismissKeyboard()
        searchButton.isEnabled = false
        
        let output = performBinarySearch(dataRange: dataRange)
        searchButton.isEnabled = true
        outputLabel.text = output ?? "No Output"
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let capturedSelf = self else { return }
            capturedSelf.searchValueTextField.text = nil
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func validateAndSetRange() {
        guard let rangeMinText = searchRangeMinTextField.text,
            let rangeMaxText = searchRangeMaxTextField.text,
            let minValue = Int(rangeMinText),
            let maxValue = Int(rangeMaxText) else { return }
        
        guard minValue < maxValue else {
            searchRangeMinTextField.text = nil
            showAlert(title: "Invalid Range", message: "Min value must be less than Max Value")
            return
        }
        
        minRangeValue = minValue
        maxRangeValue = maxValue
        configureRangeValueLabel(min: minRangeValue, max: maxRangeValue)
    }
    
    private func setRange(min: Int, max: Int) {
        var newRange: [Int] = []
        for i in min...max {
            newRange.append(i)
        }
        dataRange = newRange
    }
    
}

extension BinarySearchViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateAndSetRange()
    }
}
