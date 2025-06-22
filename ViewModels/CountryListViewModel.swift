import Foundation
import Observation

@Observable
final class CountryListViewModel {
    var countries: [Country] = []

    private let countryService: CountryServiceProtocol

    init(countryService: CountryServiceProtocol = ServiceLocator.shared.getService()) {
        self.countryService = countryService
        loadCountries()
    }

    func loadCountries() {
        countries = countryService.fetchCountries()
    }
}
