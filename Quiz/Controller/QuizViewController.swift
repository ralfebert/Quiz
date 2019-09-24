// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var showNextQuestionButton: UIButton!

    // MARK: - Zustand

    var round = QuizRound() {
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

        let question = self.round.question

        self.questionLabel.text = question.text

        // Buttons aktualisieren
        precondition(question.answers.count == self.answerButtons.count)
        for (button, answer) in zip(self.answerButtons, question.answers) {
            button.title = answer
            button.backgroundColor = self.round.colorFor(answer: answer)
        }

        // Buttons je nach Zustand deaktivieren/ausblenden
        self.showNextQuestionButton.isVisible = self.round.isAnswered
        for button in self.answerButtons {
            button.isUserInteractionEnabled = !self.round.isAnswered
        }
    }

    // MARK: - Frage

    @IBAction func showNextQuestion() {
        self.round = QuizRound()
    }

    // MARK: - Antwort

    @IBAction func answerButtonTapped(sender: UIButton) {
        let answer = sender.title(for: .normal)!
        self.round.answered(answer)
    }

}

private extension QuizRound {

    func colorFor(answer: String) -> UIColor {
        if case let .answered(givenAnswer) = self.state {
            if self.question.correctAnswer == answer {
                return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            }
            if givenAnswer == answer {
                return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
        return UIColor(white: 0.95, alpha: 1)
    }

}
