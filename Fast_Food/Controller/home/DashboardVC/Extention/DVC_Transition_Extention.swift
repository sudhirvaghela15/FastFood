//
//  DVC_Transition_Extention.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//DVC = Dashboard view controller

import Foundation
import UIKit


// MARK: transitionDelegate
extension DashboardViewController :
    UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

