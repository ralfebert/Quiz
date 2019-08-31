// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import Foundation

struct Country: Equatable {
    var name: String
    var capital: String
}

extension Country {

    static let allCountries = [
        Country(name: "Deutschland", capital: "Berlin"),
        Country(name: "Frankreich", capital: "Paris"),
        Country(name: "Belgien", capital: "Brüssel"),
        Country(name: "Griechenland", capital: "Athen"),
        Country(name: "Österreich", capital: "Wien"),
    ]

}
