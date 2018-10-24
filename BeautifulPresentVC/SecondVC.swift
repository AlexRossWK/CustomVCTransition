//
//  SecondVC.swift
//  BeautifulPresentVC
//
//  Created by Алексей Россошанский on 24/10/2018.
//  Copyright © 2018 AlexeyRossoshasky. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    var startFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func closeVCButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}

extension SecondVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatorPresent(startFrame: self.startFrame)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatorDismiss(endFrame: self.startFrame)
    }
}
