//
//  RootPresentationViewController.swift
//  Kindling
//
//  Created by Heather Connery on 2015-11-02.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class RootPresentationViewController: UIViewController {
    
   
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        switch sender.state {
        case .Began:
           //let initialPosition = translation.x
            print("begin")
        case .Ended:
            centerConstraint.constant = 0
        default:
            centerConstraint.constant = translation.x
            
            if centerConstraint.constant > view.bounds.width / 2 {
                centerConstraint.constant = view.bounds.width / 2
            } else if centerConstraint.constant < -view.bounds.width / 2 {
                centerConstraint.constant = -view.bounds.width / 2
            }
            view.layoutIfNeeded()
        }

    }
    
    @IBOutlet weak var containerOutlet: RoundedImageView!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
