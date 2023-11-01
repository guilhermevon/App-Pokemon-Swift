import UIKit
import Kingfisher

extension UIImageView {
    func loadFromUrl(_ url: String) {
        self.kf.setImage(with: URL(string: url))
    }
}
