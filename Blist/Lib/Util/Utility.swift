
import Foundation
import UIKit

struct Utility {
  
    /** 今日の日付を文字列で取得
     * - return 2017-10-20 15:14:30
     */
    static func getNowClockString(format: String = "yyyy/MM/dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let now = Date()
        return formatter.string(from: now)
    }
    
    /** 今日の日付をDate型で取得
     * - return 2017-10-20 15:14:30
     */
    static func getNowClockDate(format: String = "yyyy/MM/dd") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let now = Date()
        return formatter.date(from: formatter.string(from: now))!
    }

    /** 前面にあるUIViewControllerを取得
     * @return
     */
    static func getTopMostViewController() -> UIViewController {
        var controller = UIApplication.shared.keyWindow?.rootViewController
        while ((controller!.presentedViewController) != nil) {
            controller = controller!.presentedViewController
        }
        
        return controller!
    }
    
}
