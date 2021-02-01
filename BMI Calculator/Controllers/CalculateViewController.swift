//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    

    
    var calculatorBrain = CalculatorBrain(   bmi : BMI(value: 0.0, advice: "No advice",color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChange(_ sender: UISlider) {
        let height = String(format:"%.2f",sender.value)
        heightLabel.text = height + "m"
        
    }
    
    @IBAction func weightChange(_ sender: UISlider) {
        let weight = String(Int(sender.value))
        weightLabel.text = weight + "Kg"
        
    }
    
    
    @IBAction func calculatePress(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight:weight)
       
       
        // to connect two Controller together and navigate between them
        self.performSegue(withIdentifier: "goToResult", sender: self)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // to check if there are more than segue connected
        if segue.identifier == "goToResult" {
            // initialize the viewCotroller that segue trigger and as! is for down casting my data type
            let destinationVC = segue.destination as! ResultViewController
            // passing data through into another Controller
            destinationVC.bmiValue = String(calculatorBrain.getBMIValue())
            
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
    
    
}

