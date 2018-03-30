
import Foundation
import UIKit

//Xibのファイル名とViewのクラス名を同じにしておく
//StoryboardのIdentifierとViewControllerのクラス名を同じにしておく
protocol UINibRouting {
    static var nibName: String { get }
}

extension UINibRouting {
    static var nibName: String { return String(describing: self) }
}

extension UINib {
    static func instantiateVie<T: UIView>() -> T where T:UINibRouting {
        guard let view = UINib(nibName: T.nibName, bundle: nil).instantiate(withOwner: self, options: nil)[0] as? T
        else {
            fatalError("cannot load nib")
        }
        return view
    }
}


protocol StoryboardRouting {
    static var storyboardIdentifier: String { get }
    static var storyboardName: String { get }
}

extension StoryboardRouting {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    static var storyboardName: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>() -> T where T: StoryboardRouting {
        guard let viewController = UIStoryboard(name: T.storyboardName, bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("cannot load storyboard")
        }

        return viewController
    }
}


