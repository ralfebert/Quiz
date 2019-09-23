// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import Foundation

extension QuizQuestion {

    static func generateCountryQuestion() -> QuizQuestion {
        let countries = Country.allCountries

        let country = countries.randomElement()!

        var capitals = countries.map { $0.capital }.shuffled().prefix(4)

        if !capitals.contains(country.capital) {
            capitals[0] = country.capital
            capitals.shuffle()
        }

        return QuizQuestion(
            text: "Wie heißt die Hauptstadt von \(country.name)?",
            answers: Array(capitals),
            correctAnswer: country.capital
        )
    }

}
