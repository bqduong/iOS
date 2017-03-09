//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by BD on 3/8/17.
//  Copyright © 2017 BD. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDefaultTipPercentages()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveDefaultTip(_ sender: AnyObject) {
        let defaultTipPercentageIndex = defaultTipControl.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.setValue(defaultTipPercentageIndex, forKey: "defaultTipPercentageIndex")
        defaults.synchronize()
    }
    
    func loadDefaultTipPercentages() {
        let defaults = UserDefaults.standard
        var tipPercentageIndex = defaults.integer(forKey: "defaultTipPercentageIndex")
        
        if tipPercentageIndex != nil {
                    defaultTipControl.selectedSegmentIndex =  Int(tipPercentageIndex)
        } else {
            tipPercentageIndex = 0
        }

    }
}
