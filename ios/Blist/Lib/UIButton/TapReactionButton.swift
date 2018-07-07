

import Foundation
import UIKit

class TapReactionButton: UIButtonX {
    
    // ボタンが押されている間は、ボーダーのalpha値を下げる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        layer.borderColor = borderColor.withAlphaComponent(0.2).cgColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        layer.borderColor = borderColor.cgColor
    }
    
}
