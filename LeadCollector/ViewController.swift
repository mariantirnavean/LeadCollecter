//
//  ViewController.swift
//  LeadCollector
//
//  Created by MindHack Academy on 21/11/2019.
//  Copyright © 2019 MindHack Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextFild: UITextField!
    @IBOutlet var passwordTextField: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var comenziCafenea: [String: String] = ["Tudor": "Latte",
                                                "Marian": "Espresso",
                                                "Norbert": "FlatWithe"]
        print(comenziCafenea)
        comenziCafenea ["Vlad"] = "Mocaccino"
        comenziCafenea ["Norbert"] = "Double Espresso"
        print(comenziCafenea)
        comenziCafenea ["Norbert"] = "doiinunu"
        print(comenziCafenea)
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPresed(_ sender: Any) {
        if let formVC =  self.storyboard?.instantiateViewController(identifier: "FormVC"){
            self.present(formVC, animated: true, completion: nil)
        }
        
    }
    
}

