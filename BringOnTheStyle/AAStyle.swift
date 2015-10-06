import UIKit

class AAStyle: NSObject {
    static func fontForStyle(style:String)->UIFont{
        switch style{
        case "p":
            return UIFont.systemFontOfSize(18);
        case "h1":
            return UIFont.boldSystemFontOfSize(36);
        case "h2":
            return UIFont.boldSystemFontOfSize(24);
        default:
            return AAStyle.fontForStyle("p");
        }
    }
}
