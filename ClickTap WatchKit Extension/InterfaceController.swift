//
//  InterfaceController.swift
//  ClickTap WatchKit Extension
//
//  Created by Jeff Price on 2015-07-16.
//  Copyright (c) 2015 Jeff Price. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tapButton:WKInterfaceButton?
    @IBOutlet weak var bpmLabel:WKInterfaceLabel?
    
    var isAnimating:Bool = false;
    var bpmCalculator:TapBpmCalculator = TapBpmCalculator();
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.bpmCalculator = TapBpmCalculator()
        self.bpmCalculator.tapSetUpdated = { (Double) -> Void in
            self.bpmLabel?.setText(String(format: "%f", self.bpmCalculator.bpm))
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    
    @IBAction func buttonWasTapped() {
        self.bpmCalculator.tap()
    }
    
//    func animateBpmIndicator() {
//        var interval:NSTimeInterval = 0.0;
//        var bpm:Double = self.bpmCalculator.bpm
//        if(bpm > 0.0) {
//            interval = (60 / bpm) / 2;
//            var options:UIViewAnimationOptions = .Repeat | .Autoreverse | .AllowUserInteraction | .CurveLinear
//            self.isAnimating = true;
//            UIView .animateWithDuration(interval, delay: 0, options: options , animations: { () -> Void in
//                self.bpmIndicator?.backgroundColor = UIColor.redColor()
//                }, completion: { (finished) -> Void in
//                    self.bpmIndicator?.backgroundColor = UIColor.blackColor()
//            });
//        }
//    }

}
