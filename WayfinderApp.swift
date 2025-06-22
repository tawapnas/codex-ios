import SwiftUI

@main
struct WayfinderApp: App {
    init() {
        ServiceLocator.shared.addService(MockCountryService() as CountryServiceProtocol)
    }

    var body: some Scene {
        WindowGroup {
            CountryListView(viewModel: CountryListViewModel())
        }
    }
}
