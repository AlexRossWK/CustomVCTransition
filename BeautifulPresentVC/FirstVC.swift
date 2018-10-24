//
//  ViewController.swift
//  BeautifulPresentVC
//
//  Created by Алексей Россошанский on 24/10/2018.
//  Copyright © 2018 AlexeyRossoshasky. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var goToSecondBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToSecondButton(_ sender: Any) {
        let newVC = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        newVC.startFrame = goToSecondBtn.frame
        self.present(newVC, animated: true, completion: nil)
    }
    
}

