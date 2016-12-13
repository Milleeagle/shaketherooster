//
//  dataHandler.swift
//  shake_the_rooster_2
//
//  Created by Emil Jones on 2016-12-07.
//  Copyright © 2016 Fackapp. All rights reserved.
//

import Foundation
import FirebaseDatabase

class dataHandler {
    var ref: FIRDatabaseReference!
    
    func write(x:String) {
        ref = FIRDatabase.database().reference()
        self.ref.child("users").child("0").setValue(["username": x])
    }
    
    
}

