//
//  mainmenu.swift
//  shake_the_rooster_2
//
//  Created by Emil Jones on 2016-04-13.
//  Copyright © 2016 Fackapp. All rights reserved.
//

import UIKit
import Foundation

class MainMenu : UIViewController{

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var quicky: UIButton!
    @IBAction func OnButtonDown(sender: AnyObject) {
      myLabel.text = "hej!!";
    }
}