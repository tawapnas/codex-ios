import UIKit

class MealsViewController: UITableViewController {
    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Meal Planner"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeal))
    }

    @objc func addMeal() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addVC = storyboard.instantiateViewController(withIdentifier: "AddMealViewController") as? AddMealViewController else { return }
        addVC.onSave = { [weak self] meal in
            self?.meals.append(meal)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(addVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealTableViewCell else {
            return UITableViewCell()
        }
        let meal = meals[indexPath.row]
        cell.titleLabel.text = meal.title
        cell.typeSegmentedControl.selectedSegmentIndex = meal.type.rawValue
        cell.vegetarianSwitch.isOn = meal.isVegetarian
        cell.notesTextField.text = meal.notes
        cell.onTypeChange = { [weak self] type in
            self?.meals[indexPath.row].type = type
        }
        cell.onVegetarianChange = { [weak self] isVeg in
            self?.meals[indexPath.row].isVegetarian = isVeg
        }
        cell.onNotesChange = { [weak self] notes in
            self?.meals[indexPath.row].notes = notes
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            self?.meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let duplicate = UIContextualAction(style: .normal, title: "Duplicate") { [weak self] _, _, completion in
            guard let meal = self?.meals[indexPath.row] else { completion(false); return }
            self?.meals.insert(meal, at: indexPath.row + 1)
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .automatic)
            completion(true)
        }
        duplicate.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [duplicate])
    }
}
