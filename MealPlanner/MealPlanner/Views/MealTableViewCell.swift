import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var notesTextField: UITextField!

    var onTypeChange: ((MealType) -> Void)?
    var onVegetarianChange: ((Bool) -> Void)?
    var onNotesChange: ((String) -> Void)?

    @IBAction func typeChanged(_ sender: UISegmentedControl) {
        let type = MealType(rawValue: sender.selectedSegmentIndex) ?? .breakfast
        onTypeChange?(type)
    }

    @IBAction func vegetarianToggled(_ sender: UISwitch) {
        onVegetarianChange?(sender.isOn)
    }

    @IBAction func notesEdited(_ sender: UITextField) {
        onNotesChange?(sender.text ?? "")
    }
}
