// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var showNextQuestionButton: UIButton!

    // MARK: - Zustand

    struct QuizViewModel {

        var state = QuizState.empty

        enum QuizState {
            case empty
            case question(question: QuizQuestion)
            case answered(question: QuizQuestion, answer: String)
        }

        mutating func answered(_ answer: String) {
            switch self.state {
                case let .question(question):
                    self.state = .answered(question: question, answer: answer)
                default:
                    fatalError("answered in state \(self) is invalid.")
            }

        }

        mutating func showNextQuestion() {
            self.state = .question(question: QuizQuestion.generateCountryQuestion())
        }

        var isAnswered: Bool {
            switch self.state {
                case .answered: return true
                default: return false
            }
        }

    }

    var model = QuizViewModel() {
        didSet {
            self.view.setNeedsLayout()
        }
    }

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNextQuestion()
    }

    // MARK: - Zustand -> View

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        switch self.model.state {
            case .empty:
                fatalError("Keine Frage gesetzt")

            case let .question(question):
                self.questionLabel.text = question.text
                precondition(question.answers.count == self.answerButtons.count)
                for (answerButton, answer) in zip(self.answerButtons, question.answers) {
                    answerButton.title = answer
                    answerButton.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
                }

            case let .answered(question, answer):
                let correctAnswer = question.correctAnswer
                let correct = answer == correctAnswer
                let correctIndex = question.answers.firstIndex(of: correctAnswer)!
                let correctButton = self.answerButtons[correctIndex]
                correctButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                if !correct {
                    let wrongIndex = question.answers.firstIndex(of: answer)!
                    let wrongButton = self.answerButtons[wrongIndex]
                    wrongButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                }
        }
        self.showNextQuestionButton.isVisible = self.model.isAnswered
        for button in self.answerButtons {
            button.isUserInteractionEnabled = !self.model.isAnswered
        }
    }

    // MARK: - Frage

    @IBAction func showNextQuestion() {
        self.model.showNextQuestion()
    }

    // MARK: - Antwort

    @IBAction func answerButtonTapped(sender: UIButton) {
        let answer = sender.title(for: .normal)!
        self.model.answered(answer)
    }

}
