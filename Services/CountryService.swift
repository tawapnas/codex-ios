import Foundation

protocol CountryServiceProtocol {
    func fetchCountries() -> [Country]
}

struct MockCountryService: CountryServiceProtocol {
    func fetchCountries() -> [Country] {
        return [
            Country(flag: "🇺🇸", name: "United States", continent: "North America"),
            Country(flag: "🇫🇷", name: "France", continent: "Europe"),
            Country(flag: "🇯🇵", name: "Japan", continent: "Asia"),
            Country(flag: "🇧🇷", name: "Brazil", continent: "South America")
        ]
    }
}
