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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let splitAmount = [1, 2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex]) / Double(splitAmount[splitControl.selectedSegmentIndex])
        
        
        let total = (tip + bill) / Double(splitAmount[splitControl.selectedSegmentIndex])
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

}

