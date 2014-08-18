//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Christopher Sherman on 8/8/14.
//  Copyright (c) 2014 Christopher Sherman. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
    get {
        return total / (taxPct + 1)
    }
    }
    
    init(total:Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double){
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        let possibleTipsInferred = [0.15, 0.18,0.20]
        
        var retVal = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retVal
    }
    
}
