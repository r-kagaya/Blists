import Foundation
import UIKit


extension UIView {

    /** UIView絶対座標取得
     * @param aView - 座標を調べるView
     * @return 絶対座標
     */
    static func absPoint(view aView: UIView) -> CGPoint {
        var ret: CGPoint = CGPoint(x: aView.frame.origin.x, y: aView.frame.origin.y)
        if let superview = aView.superview {
            let addPoint = self.absPoint(view: superview)
            ret = CGPoint(x: ret.x + addPoint.x, y: ret.y + addPoint.y)
        }
        return ret
    }
    
    /** キャプチャ
     * @return UIImage
     */
    func capture() -> UIImage {
        // キャプチャする範囲を取得.
        let rect = self.bounds
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // 対象のview内の描画をcontextに複写する.
        self.layer.render(in: context)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    /*
     *  スクショ
     *  let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
     *  label.text = "Hello"
     *  label.textAlignment = .center
     *  label.backgroundColor = .white
     *  let image = label.screenShot(width: 200)
     */
    func screenShot(width: CGFloat) -> UIImage? {
        let imageBounds = CGRect(x: 0, y: 0, width: width, height: bounds.size.height * (width / bounds.size.width))
        
        UIGraphicsBeginImageContextWithOptions(imageBounds.size, true, 0)
        
        drawHierarchy(in: imageBounds, afterScreenUpdates: true)
        
        var image: UIImage?
        let contextImage = UIGraphicsGetImageFromCurrentImageContext()
        
        if let contextImage = contextImage, let cgImage = contextImage.cgImage {
            image = UIImage(
                cgImage: cgImage,
                scale: UIScreen.main.scale,
                orientation: contextImage.imageOrientation
            )
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /** Resizeするクラスメソッド.
     * @param width - 幅
     * @param height - 高さ
     * @return UIImage
     */
    func resize(width : CGFloat, height : CGFloat)-> UIImage!{
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // コンテキストに自身に設定された画像を描画する.
        self.draw(CGRect(x: 0, y: 0, width: width, height: height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /** UIViewから、自分を配置しているViewControllerを取得する
     * @return ViewController
     */
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
    
    /** UIViewから、指定コンポーネントをリストする
     * @param aClass - 指定コンポーネントクラス(例：UITextField.self)
     * @param aParentView - サーチを始めるView
     * @return 指定コンポーネントリスト
     */
    func retrieveUIView(class aClass: AnyClass, parentView aParentView: UIView) -> [UIView] {
        var views: [UIView] = []
        
        for childView in aParentView.subviews {
            
            // childViewのクラス名を出力
            // println("クラス: \(childView.dynamicType.description())")
            
            // childViewがaClassのインスタンスならばarrayに追加
            if type(of: (childView as NSObject)).isEqual(aClass) {
                views.append(childView)
            }
            
            // 子のビューについて再帰
            views += self.retrieveUIView(class: aClass, parentView: childView as UIView)
        }
        
        return views
    }
    
    /*
     *  view.removeAllSubViews()
     *  子Viewを全て削除
     */
    func removeAllSubviews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
}



