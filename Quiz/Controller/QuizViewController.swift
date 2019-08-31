// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var showNextQuestionButton: UIButton!

    // MARK: - Zustand

    var question: QuizQuestion?

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNextQuestion()
    }

    // MARK: - Frage

    @IBAction func showNextQuestion() {
        self.question = QuizQuestion.generateCountryQuestion()
        self.showQuestion()
    }

    func showQuestion() {
        guard let question = question else {
            fatalError("Ungültiger Zustand: Keine Frage gesetzt")
        }
        self.questionLabel.text = question.text
        precondition(question.answers.count == self.answerButtons.count)
        for (i, answer) in question.answers.enumerated() {
            let answerButton = self.answerButtons[i]
            answerButton.setTitle(answer, for: .normal)
            answerButton.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            answerButton.isUserInteractionEnabled = true
        }
        self.showNextQuestionButton.isHidden = true
    }

    // MARK: - Antwort

    @IBAction func answerButtonTapped(sender: UIButton) {
        self.showAnswer(answer: sender.title(for: .normal)!)
    }

    func showAnswer(answer: String) {
        guard let question = question else {
            fatalError("Ungültiger Zustand: Keine Frage gesetzt")
        }
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
        for button in self.answerButtons {
            button.isUserInteractionEnabled = false
        }
        self.showNextQuestionButton.isHidden = false
    }

}
