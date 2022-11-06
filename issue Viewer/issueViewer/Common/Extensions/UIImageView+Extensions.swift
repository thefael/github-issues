import UIKit

extension UIImageView {
   func rounded() {
       let radius = self.frame.width / 2
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = false
       self.clipsToBounds = true
   }
}
