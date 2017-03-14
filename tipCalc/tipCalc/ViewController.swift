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
    
    var defaultTipPercentageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "gra·tu·i·ty"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0 , y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "gra·tu·i·ty"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        defaultTipPercentageIndex = loadDefaultTipPercentages()
        
        setupMenuBar()
        setupSettingsButton()
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
    
    func calculateTip(index: Int) {
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = Double(bill * tipPercentages[index])
        let total = bill + tip
        
        tipLabel.text = String(format: "+$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    func loadDefaultTipPercentages() -> Int {
        let defaults = UserDefaults.standard
        let tipPercentageIndex = defaults.integer(forKey: "defaultTipPercentageIndex")
        let tipPercentageIndexInt = Int(tipPercentageIndex)
        
        tipControl.selectedSegmentIndex = tipPercentageIndexInt
        
        return tipPercentageIndexInt
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
        menuBar.viewController = self
        menuBar.setDefaultSelection()
    }
    
    func setupSettingsButton() {
        let settingsImage = UIImage(named: "nav_more")?.withRenderingMode(.alwaysOriginal)
        let settingsButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(handleSettings))
        
        navigationItem.rightBarButtonItems = [settingsButtonItem]
    }
    
    let settingsLauncher = SettingsLauncher()
    
    func handleSettings() {
        billField.resignFirstResponder()
        settingsLauncher.viewController = self
        settingsLauncher.showSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadDefaultTipPercentages()
        menuBar.setDefaultSelection()
        calculateTip(self)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
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
