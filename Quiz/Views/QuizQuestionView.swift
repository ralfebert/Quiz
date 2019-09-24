// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct QuizQuestionView: View {

    @State var round = QuizRound()

    var question: QuizQuestion { self.round.question }

    var body: some View {

        VStack {

            Text(question.text)
                .font(.headline)

            ForEach(question.answers, id: \.self) { answer in

                Button(
                    action: {
                        withAnimation {
                            self.round.answered(answer)
                        }
                    },
                    label: {
                        Text(answer)
                            .padding(15)
                            .frame(maxWidth: .infinity)
                    }
                )
                .disabled(self.round.isAnswered)
                .background(self.round.colorFor(answer: answer))
                .cornerRadius(10)
            }

            if round.isAnswered {
                Button("Nächste Frage") {
                    withAnimation {
                        self.round = QuizRound()
                    }
                }
                .padding(.top, 20)
            }

        }
        .padding(15)

    }

}

private extension QuizRound {

    func colorFor(answer: String) -> Color {
        if case let .answered(givenAnswer) = self.state {
            if self.question.correctAnswer == answer {
                return Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            }
            if givenAnswer == answer {
                return Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
            }
        }

        return Color(white: 0.95)
    }

}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView()
    }
}
