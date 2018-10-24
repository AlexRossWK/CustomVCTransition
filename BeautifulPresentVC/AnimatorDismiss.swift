//
//  AnimatorDismiss.swift
//  BeautifulPresentVC
//
//  Created by Алексей Россошанский on 24/10/2018.
//  Copyright © 2018 AlexeyRossoshasky. All rights reserved.
//

import UIKit

class AnimatorDismiss: NSObject, UIViewControllerAnimatedTransitioning {
    
    let endFrame: CGRect
    
    init(endFrame: CGRect) {
        self.endFrame = endFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let vcTo = transitionContext.viewController(forKey: .to),
            let vcFrom = transitionContext.viewController(forKey: .from),
            let snapshot = vcFrom.view.snapshotView(afterScreenUpdates: true) else {
                return
        }
        
        let vContainer = transitionContext.containerView
        vContainer.addSubview(vcTo.view)
        vContainer.addSubview(snapshot)
        
        vcFrom.view.isHidden = true
        
        UIView.animate(withDuration: 0.3, animations: {
            snapshot.frame = self.endFrame
        }, completion: { success in
            transitionContext.completeTransition(true)
        })
    }
}
