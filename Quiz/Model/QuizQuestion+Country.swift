// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import Foundation

extension QuizQuestion {

    static func generateCountryQuestion() -> QuizQuestion {
        let allCountries = Country.allCountries
        let country = allCountries.randomElement()!
        let correctAnswer = country.capital

        var answers = Array(allCountries.map { $0.capital }.shuffled().prefix(4))
        if !answers.contains(correctAnswer) {
            answers[answers.indices.randomElement()!] = correctAnswer
        }

        return QuizQuestion(
            text: "Wie heißt die Hauptstadt von \(country.name)?",
            answers: answers,
            correctAnswer: correctAnswer
        )
    }

}
