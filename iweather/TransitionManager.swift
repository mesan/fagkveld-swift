//
//  TransitionManager.swift
//
//  Created by Harald Alexander Kulø on 28.10.14.
//  Copyright (c) 2014 Harald Alexander Kulø. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerTransitioningDelegate{
    // MARK: UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Transition(presenting: true)
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Transition(presenting: false)
    }
    
}
