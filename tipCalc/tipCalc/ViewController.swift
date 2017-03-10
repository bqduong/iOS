//
//  ViewController.swift
//  tipCalc
//
//  Created by BD on 3/1/17.
//  Copyright © 2017 BD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = Double(bill * tipPercentages[tipControl.selectedSegmentIndex])
        let total = bill + tip
        
        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    func loadDefaultTipPercentages() {
        let defaults = UserDefaults.standard
        let tipPercentageIndex = defaults.integer(forKey: "defaultTipPercentageIndex")
        
        tipControl.selectedSegmentIndex =  Int(tipPercentageIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        billField.becomeFirstResponder()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadDefaultTipPercentages()
        calculateTip(self)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 81/255, green: 169/255, blue: 90/255, alpha: 1)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will disappear")
            }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view did disappear")
    }
}

