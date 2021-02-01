//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rihab Al-yasiri on 01.02.21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float ){
      
        if bmi != nil {
            let bmiValue = ceil(weight / (height * height))
            
            if bmiValue < 18.5 {
                bmi = BMI(value: bmiValue, advice: "Eat more pies",color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
            } else if bmiValue < 24.9 {
                bmi = BMI(value: bmiValue, advice: "Fit as a fiddle",color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            }else {
                bmi = BMI(value: bmiValue, advice: "Eat less pies",color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
            }
            
          
            
         //   BMI = BMI(value: bmiValue, advice: "",color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
          
        }
    }
    
    func getBMIValue() -> String {
        if bmi != nil {
            return String(format: "%.1f", bmi?.value ?? "0.0")
        }
        return "0.0"
    }
    
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
 
}
