//
//  MenuAnimation.swift
//  Fast_Food
//
//  Created by sudhir on 27/05/21.
//

import UIKit

class MenuAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      guard  let to    = transitionContext.viewController(forKey: .to),
             let frome = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        let finalWidth = Int(containerView.bounds.width * 0.6)
        let finalHight = Int(to.view.bounds.height)
        
        if isPresenting{
            
            //add dimming view
            containerView.addSubview(dimmingView)
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            dimmingView.frame = containerView.bounds
            
            //add menuviewController to containerview
            containerView.addSubview(to.view)
            
            //Init frame off the screen
            
            to.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHight)
        }
        
        //animate on screen
        let transform = { [self] in
            dimmingView.alpha = 0.5
            to.view.transform = CGAffineTransform(translationX: CGFloat(finalWidth), y: 0)
        }
        
        //Animate back off screen
        let identity = { [self] in
            dimmingView.alpha = 0.0
            frome.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        
        UIView.animate(withDuration: duration, animations: { [self] in
            isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    

}
