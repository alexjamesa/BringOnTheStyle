import UIKit

@IBDesignable class AALabel: UILabel {
    @IBInspectable var style:String="p"{
        didSet{self.font=AAStyle.fontForStyle(style)}
    }
}
