# BringOnTheStyle
*Bringing CSS-like text styles to XCode. Update your styles and see the changes in Interface Builder right away.*

Text styles + XCode? Yes, please. I'd been looking for a way to a) define text styles in a central place, while b) viewing these styles in action in Interface Builder (without firing up the simulator!). That way I could easily tweak my font sizes, try out different fonts, and swap colours for a whole bunch of objects at once—all with minimal hassle. After some experimenting, it turns out this is totally possible with the help of IBInspectable and IBDesignable. 

Download the sample code to see a pithy example, and/or just follow these steps:

1. Add a styles class called AAStyle. This is where you'll define all your fonts:

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

2. Subclass UILabel (and any other objects you like), call it AALabel, and enter the following code:

        import UIKit
        
        @IBDesignable class AALabel: UILabel {
          @IBInspectable var style:String="p"{
            didSet{self.font=AAStyle.fontForStyle(style)} 
          }
        }


3. In Interface Builder, drag out a label from the *Object Library* and change its class to AALabel (first field in XCode's *Identity Inspector*).

4. In Interface Builder, open up the *Attributes Inspector* and check out the *Style* field up top. This is the magic of IBInspectable! Just change it to p, h1, h2, or any other styles you've defined, and you'll see the label update right away.

At any point, you can jump into AAStyle and redefine your styles. That's it! This example is just for fonts, but you can easily modify it to work with colours and more. (To be honest, I'd love it if we could just select p, h1, or h2 in a drop-down in Interface Builder, but it looks like that's not possible just yet. If you know otherwise, let me know!)


