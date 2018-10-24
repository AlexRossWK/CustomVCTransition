//
//  AnimatorPresent.swift
//  BeautifulPresentVC
//
//  Created by Алексей Россошанский on 24/10/2018.
//  Copyright © 2018 AlexeyRossoshasky. All rights reserved.
//

import UIKit

class AnimatorPresent: NSObject, UIViewControllerAnimatedTransitioning {
    let startFrame: CGRect
    
    init(startFrame: CGRect) {
        self.startFrame = startFrame
    }
    
   
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //фотка презентуемого VC
        guard let vcTo = transitionContext.viewController(forKey: .to),
            let snapshot = vcTo.view.snapshotView(afterScreenUpdates: true) else {
                return
        }
        
        //откуда пришли
        let vContainer = transitionContext.containerView
        
        //добавляем
        vcTo.view.isHidden = true
        vContainer.addSubview(vcTo.view)
        
        //Готовим фотку для анимации (сначала с размер кнопки)
        snapshot.frame = self.startFrame
        vContainer.addSubview(snapshot)
        
        UIView.animate(withDuration: 0.3, animations: {
            //Увеличиваем фотку
            snapshot.frame = (transitionContext.finalFrame(for: vcTo))
        }, completion: { success in
            //Скрываем фотку и отображаем настоящий vc
            vcTo.view.isHidden = false
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
}
