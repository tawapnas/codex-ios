import UIKit

class AddMealViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var notesTextView: UITextView!

    var onSave: ((Meal) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Meal"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMeal))
    }

    @objc func saveMeal() {
        let title = titleTextField.text ?? ""
        let type = MealType(rawValue: typeSegmentedControl.selectedSegmentIndex) ?? .breakfast
        let meal = Meal(title: title, type: type, isVegetarian: vegetarianSwitch.isOn, notes: notesTextView.text)
        onSave?(meal)
        navigationController?.popViewController(animated: true)
    }
}
