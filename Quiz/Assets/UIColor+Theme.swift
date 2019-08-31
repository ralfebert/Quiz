// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

extension UIColor {

    static var themeLightGray: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemBackground
        } else {
            return UIColor(white: 0.95, alpha: 1)
        }
    }

    static var themeCorrect: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "Correct")!
        } else {
            return UIColor(red: 149 / 255, green: 210 / 255, blue: 107 / 255, alpha: 1.0) /* #95d26b */
        }
    }

    static var themeWrong: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { traits in
                if traits.userInterfaceStyle == .dark {
                    return UIColor(hue: 9 / 360, saturation: 86 / 100, brightness: 61 / 100, alpha: 1.0) /* #9b2915 */
                } else {
                    return UIColor(hue: 40 / 360, saturation: 86 / 100, brightness: 95 / 100, alpha: 1.0) /* #f3af22 */
                }
            }
        } else {
            return UIColor(hue: 9 / 360, saturation: 86 / 100, brightness: 61 / 100, alpha: 1.0) /* #9b2915 */
        }
    }

}
