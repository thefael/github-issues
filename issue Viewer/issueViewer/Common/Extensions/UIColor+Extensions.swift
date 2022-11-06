import UIKit

extension UIColor {
    static let openColor: UIColor = .hexToUIColor(hex: "3fba4f")
    static let closedColor: UIColor = .hexToUIColor(hex: "a371f7")
    static let backgroundColor: UIColor = .hexToUIColor(hex: "0c1117")
    static let textColor: UIColor = .hexToUIColor(hex: "c7d2d9")
    static let separatorColor: UIColor = .hexToUIColor(hex: "515151")
    static let selectedColor: UIColor = .hexToUIColor(hex: "343434")
    static func hexToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
