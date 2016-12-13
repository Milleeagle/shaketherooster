//
//  Shake.swift
//  shake_the_rooster_2
//
//  Created by Emil Jones on 2016-04-16.
//  Copyright © 2016 Fackapp. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion


class ShakeController : UIViewController {
    

    @IBOutlet weak var shakeLAbel: UILabel!
    @IBOutlet weak var image: Ellipse!
    @IBOutlet weak var timerLabel: UILabel!
    
    var shakes : Int = 0;
    var ticksToCount : Int = 1000;
    var timerCounter = 0
    var isShaking:Bool = false;
    var timer : NSTimer = NSTimer();
    var motionManager: CMMotionManager!;
    var imageTranslator:ImageTranslator!;
    var data:dataHandler!;
    
    
    var oldShakeX :Double = 0.1 ;
    var oldShakeY :Double = 0.1 ;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager = CMMotionManager()
        view.addSubview(image);
        imageTranslator = ImageTranslator(img: image, view : view);
        data = dataHandler();
        data.write("Im god");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(!isShaking) {
            if(motion == .MotionShake) {
                motionManager.startAccelerometerUpdates();
                self.shakeLAbel.text = "Started shaking";
                createTimer();
                isShaking = true;
            }
        }
    }
    
    func createTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: #selector(ShakeController.updateCounter), userInfo: nil, repeats: true)
        
    }
    
    func updateCounter() {
        timerLabel.text = String(timerCounter+=1)
        
        if let accelerometerData = motionManager.accelerometerData {
            let shaking =  checkShakeData(accelerometerData.acceleration.x,y:accelerometerData.acceleration.y);
            
            if(shaking) {
                imageTranslator.update();
                shakeImg();
            }
            
            self.shakeLAbel.text = "Shaking...";
        }
        
        let timerString = String(ticksToCount - timerCounter)
        self.timerLabel.text = timerString;
        
        
        if(timerCounter >= ticksToCount){
            timer.invalidate();
            timerCounter = 0;
            let myString = String(shakes)
            self.shakeLAbel.text = "Nr of Shakes : " + myString;
            imageTranslator.setDead();
        }
    }
    
    func shakeImg() {
        
        let rand: Int = random() % 100;
        let angle: Double = 2 * M_PI / 100;
        imageTranslator.addPush(angle * (Double(rand)));
        imageTranslator.update();
    }
    
    func checkShakeData(x:Double,y:Double) -> Bool {
        
        var shaked : Bool = false;
        
        if(oldShakeX > 0 && x < 0){
            oldShakeX = x;
            shaked = true;
        } else if(oldShakeX < 0 && x > 0 ){
            oldShakeX = x;
            shaked = true;
        }
        //if(oldShakeY > 0 && y < 0){
          //  oldShakeY = x;
           // shaked = true;
        //} else if(oldShakeY < 0 && y > 0 ){
          //  oldShakeY = y;
          //  shaked = true;
        //}
        
        if(shaked){
            shakes+=1;
        }
        
        
        
        if(x >= 0.1 ) {
            return true;
        }
        if (y >= 0.1){
            return true;
        }
        
        return false;
    }
    
    
    
    
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            
        }
    }
    
}