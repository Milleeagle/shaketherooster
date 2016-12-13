//
//  ViewController.swift
//  shake_the_rooster_2
//
//  Created by Emil Jones on 2016-03-31.
//  Copyright © 2016 Fackapp. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var timer: Int = 0;
    @IBOutlet weak var btnQuick: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 
        if let shakeView = segue.destinationViewController as? ShakeController {
            shakeView.ticksToCount = timer;
        }
    }
    
    @IBAction func btnQuickPressed(sender: AnyObject) {
        timer = 400;
        
    }
    @IBAction func btnNormalPressed(sender: AnyObject) {
         timer = 1000;
    }
   
    @IBAction func btnMarathonPressed(sender: AnyObject) {
         timer = 2500;
    }
}

