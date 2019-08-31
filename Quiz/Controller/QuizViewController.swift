// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var showNextQuestionButton: UIButton!

    // MARK: - Zustand

    // MARK: - Lebenszyklus

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNextQuestion()
    }

    // MARK: - Frage

    @IBAction func showNextQuestion() {
        self.generateQuestion()
        self.showQuestion()
    }

    func generateQuestion() {
        let allCountries = Country.allCountries

        // TODO: Implementiere generateQuestion so dass eine Frage "Was ist die Hauptstadt von <Land>?" und vier Antwortmöglichkeiten generiert werden und als ViewController-Eigenschaften unter Zustand abgelegt werden

    }

    func showQuestion() {
        // TODO: Implementiere showQuestion so, dass die Frage angezeigt wird
    }

    // MARK: - Antwort

    @IBAction func answerButtonTapped(sender: UIButton) {
        self.showAnswer(answer: sender.title(for: .normal)!)
    }

    func showAnswer(answer: String) {
        // TODO: Implementiere showAnswer so, dass die richtige und ggf. falsche Antwort farblich hervorgehoben wird
    }

}
