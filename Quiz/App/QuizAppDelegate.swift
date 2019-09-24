// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import SwiftUI
import UIKit

@UIApplicationMain
class QuizAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: QuizQuestionView())
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
