// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

extension UIView {

    var isVisible: Bool {
        get { !isHidden }
        set { self.isHidden = !newValue }
    }

}
