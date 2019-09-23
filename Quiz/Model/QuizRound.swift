// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

struct QuizRound {

    var state = QuizState.question
    var question = QuizQuestion.generateCountryQuestion()

    enum QuizState {
        case question
        case answered(answer: String)
    }

    mutating func answered(_ answer: String) {
        switch self.state {
            case .question:
                self.state = .answered(answer: answer)
            default:
                fatalError("answered in state \(self) is invalid.")
        }

    }

    var isAnswered: Bool {
        switch self.state {
            case .answered: return true
            default: return false
        }
    }

}
