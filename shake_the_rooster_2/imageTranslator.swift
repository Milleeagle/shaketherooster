//
//  imageTranslator.swift
//  shake_the_rooster_2
//
//  Created by Emil Jones on 2016-04-01.
//  Copyright © 2016 Fackapp. All rights reserved.
//
import UIKit
import Foundation
class Ellipse: UIImageView {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
}


class ImageTranslator {

    var image: Ellipse!;
    var tick : Int = 0;
    var picOne : Bool = true;
    var animator : UIDynamicAnimator;
    var gravity : UIGravityBehavior;
    var collision: UICollisionBehavior!
    var pushBehavior : UIPushBehavior!;
    
    internal init(img:Ellipse?, view:UIView) {
        image = img;
        animator = UIDynamicAnimator(referenceView:view )
        gravity = UIGravityBehavior(items: [image])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [image])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        let itemBehaviour = UIDynamicItemBehavior(items: [image])
        itemBehaviour.elasticity = 0.4;
        itemBehaviour.friction = 1;
        animator.addBehavior(itemBehaviour)
        
    }
    
    func addPush(angle:Double){
        
        if((pushBehavior) != nil){
            animator.removeBehavior(pushBehavior)
        }
        pushBehavior = UIPushBehavior(items: [image], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.setAngle( CGFloat(angle) , magnitude: 5);
        animator.addBehavior(pushBehavior);
        print(angle);
        
    }

    
    func update() {
        tick += 1;
        if(tick >= 10){
            tick = 0;
            if(picOne){
                let img = UIImage(named:"rooster_2")!
                image.image = img;
                picOne = false;
            }
            else {
                let img = UIImage(named:"rooster_1")!
                image.image = img;
                picOne = true;
            }
            
        }
    }
    
    
    func setDead() {
        let img = UIImage(named:"rooster_3")!
        image.image = img;
    }
}
