//
//  ViewController.swift
//  ClickTap
//
//  Created by Jeff Price on 2015-03-15.
//  Copyright (c) 2015 Jeff Price. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tapButton:UIView?
    @IBOutlet weak var bpmLabel:UILabel?
    @IBOutlet weak var tapGestureRecognizer:UITapGestureRecognizer?
    @IBOutlet weak var bpmIndicator:UIView?
    
    var isAnimating:Bool = false;
    var bpmCalculator:TapBpmCalculator = TapBpmCalculator();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bpmCalculator = TapBpmCalculator()
        self.bpmCalculator.tapSetUpdated = { (Double) -> Void in
            self.bpmLabel?.text = String(format: "%f", self.bpmCalculator.bpm)
            self.bpmIndicator?.layer.removeAllAnimations()
            self.animateBpmIndicator()
        }
        
        
        self.tapButton?.addGestureRecognizer(self.tapGestureRecognizer!);
        
        self.bpmIndicator?.layer.cornerRadius = 7.5;
        self.bpmIndicator?.layer.masksToBounds = true;
        self.bpmIndicator?.backgroundColor = UIColor.blackColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonWasTapped() {
        self.bpmCalculator.tap()
    }
    
    func animateBpmIndicator() {
        var interval:NSTimeInterval = 0.0;
        var bpm:Double = self.bpmCalculator.bpm
        if(bpm > 0.0) {
            interval = (60 / bpm) / 2;
            var options:UIViewAnimationOptions = .Repeat | .Autoreverse | .AllowUserInteraction | .CurveLinear
            self.isAnimating = true;
            UIView .animateWithDuration(interval, delay: 0, options: options , animations: { () -> Void in
                self.bpmIndicator?.backgroundColor = UIColor.redColor()
            }, completion: { (finished) -> Void in
                self.bpmIndicator?.backgroundColor = UIColor.blackColor()
            });
        }
    }
    
}

