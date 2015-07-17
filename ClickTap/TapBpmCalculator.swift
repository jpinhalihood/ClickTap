//
//  TapBpmCalculator.swift
//  ClickTap
//
//  Created by Jeff Price on 2015-03-15.
//  Copyright (c) 2015 Jeff Price. All rights reserved.
//

import Foundation

class TapBpmCalculator {
    
    let MAX_TAPSET_INDEX:Int = 1
    var bpm:Double = 0.0
    var tapSet = [Double](count: 2, repeatedValue: 0.0)
    var tapSetIndex:Int = 0
    
    var tapSetUpdated:((Double) -> ())?
    
    init() {
    }
    
    func tap() -> Double {

        if(self.tapSetIndex <= MAX_TAPSET_INDEX) {
            var time:Double = NSDate().timeIntervalSince1970
            self.tapSet[self.tapSetIndex] = time
        }
        
        if(self.tapSetIndex == MAX_TAPSET_INDEX) {
            bpm = calulateBPM()
            self.tapSetIndex = 0
            if let tapSetUpdatedHandler = self.tapSetUpdated {
                tapSetUpdatedHandler(bpm)
            }
        } else {
            self.tapSetIndex++
        }
        
        return bpm
    }
    
    func calulateBPM() -> Double {
        return floor(60.0/(self.tapSet.last! - self.tapSet.first!))
    }
}