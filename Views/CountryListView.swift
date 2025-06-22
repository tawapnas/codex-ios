import SwiftUI
import Observation

struct CountryListView: View {
    @Bindable var viewModel: CountryListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.countries) { country in
                HStack {
                    Text(country.flag)
                    VStack(alignment: .leading) {
                        Text(country.name)
                        Text(country.continent)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Countries")
        }
    }
}

#Preview {
    CountryListView(viewModel: CountryListViewModel())
}
