// © 2019 Ralf Ebert — iOS Example Project: Quiz
// License: https://opensource.org/licenses/MIT

import UIKit

extension UIButton {

    var title: String? {
        get { self.title(for: .normal) }
        set { self.setTitle(newValue, for: .normal) }
    }

}
