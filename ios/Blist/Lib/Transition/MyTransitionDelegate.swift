

import Foundation
import UIKit

class MyTransitionDelegate : NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return MyPresentedAnimater()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return MyDismissedAnimater()
    }
}

class MyPresentedAnimater : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.3
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
//        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
//        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
//        let container = transitionContext.containerView
//        let imageView = (fromVC as! FirstViewController).copyImageView()
//        let destImageViewRect = (toVC as! SecondViewController).imageViewRect()
//        container.addSubview(toVC.view)
//        container.addSubview(imageView)
//        toVC.view.alpha = 0.0
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.01, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [], animations: {
//            toVC.view.alpha = 1.0
//            imageView.frame = destImageViewRect
//        }, completion: {_ in
//            transitionContext.completeTransition(true)
//        })
    }
}

class MyDismissedAnimater : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.3
    }
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        transitionContext.completeTransition(true)
    }
}
