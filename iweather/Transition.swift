//
//  Transition.swift
//  iweather
//
//  Created by Harald Alexander Kulø on 24.11.14.
//  Copyright (c) 2014 Mesan. All rights reserved.
//
import UIKit
import QuartzCore


class Transition : NSObject, UIViewControllerAnimatedTransitioning{
    
    private var presenting = false
    
    init(presenting:Bool) {
        self.presenting = presenting
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let screens : (from:UIViewController, to:UIViewController) = (
            transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
            transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        )
        let container = transitionContext.containerView()
        
        let menuViewController = !self.presenting ? screens.from as DetailViewController: screens.to as DetailViewController
        let navigationController = !self.presenting ? screens.to as UINavigationController : screens.from as UINavigationController
        let viewController = navigationController.topViewController as ViewController
        
        let menuView = menuViewController.view
        let mainView = navigationController.view
        container.addSubview(mainView)
        container.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        //set the stage for first animation.
        if (self.presenting){
            menuView.alpha=0
        }
        
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
            if (self.presenting){
                //do anim...oppgave7
                menuView.alpha=1
            }
            else {
                //do anim...oppgave7
                menuView.alpha=0
            }
            
            }, completion: { finished in
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
        })
    }
}
