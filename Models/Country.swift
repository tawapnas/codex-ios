import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    let flag: String
    let name: String
    let continent: String
}
