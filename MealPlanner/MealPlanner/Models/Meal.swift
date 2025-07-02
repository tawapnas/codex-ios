import Foundation

enum MealType: Int, CaseIterable {
    case breakfast, lunch, dinner

    var title: String {
        switch self {
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        }
    }
}

struct Meal {
    var title: String
    var type: MealType
    var isVegetarian: Bool
    var notes: String
}
