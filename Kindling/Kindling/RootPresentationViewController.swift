//
//  RootPresentationViewController.swift
//  Kindling
//
//  Created by Heather Connery on 2015-11-02.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class RootPresentationViewController: UIViewController {
    
    var selectionState: SelectionState = .NoSelection
    
    enum SelectionState {
        case NoSelection
        case LikeSelection
        case DislikeSelection
    }
    
   
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        switch sender.state {
        case .Began:
           //let initialPosition = translation.x
            print("begin")
        case .Ended:
            centerConstraint.constant = 0
            if selectionState == SelectionState.LikeSelection {
                performSegueWithIdentifier("LikeSegue", sender: sender)
            } else if selectionState == SelectionState.DislikeSelection {
                performSegueWithIdentifier("DislikeSegue", sender: sender)
            }
            
        default:
            centerConstraint.constant = translation.x
            
            if centerConstraint.constant >= view.bounds.width / 2 {
                centerConstraint.constant = view.bounds.width / 2
                selectionState = .LikeSelection
            } else if centerConstraint.constant <= -view.bounds.width / 2 {
                centerConstraint.constant = -view.bounds.width / 2
                selectionState = .DislikeSelection
            }
            view.layoutIfNeeded()
        }
        print(selectionState)
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
