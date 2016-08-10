//
//  ViewController.swift
//  tipnow
//
//  Created by Goodman, Dustin on 8/5/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
               
        // 2
        gradientLayer.frame = self.view.bounds
        
        // 3
        let color1 = UIColor(red:0.32, green:0.29, blue:0.62, alpha:1.0).CGColor as CGColorRef
        let color2 = UIColor(red:0.14, green:0.78, blue:0.86, alpha:1.0).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        
        // 4
        gradientLayer.locations = [0.0, 1.0]
        
        // 5
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    @IBAction func calculateTip(sender: AnyObject) {
        
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let splitAmount = [1, 2, 3, 4]
        
        let bill = Double(billField.text!) ?? 0
        let billTotal = bill / Double(splitAmount[splitControl.selectedSegmentIndex])
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex]) / Double(splitAmount[splitControl.selectedSegmentIndex])
        
        
        let total = (tip + billTotal)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
    
    

}

