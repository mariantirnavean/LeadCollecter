//
//  FormViewController.swift
//  LeadCollector
//
//  Created by MindHack Academy on 21/11/2019.
//  Copyright © 2019 MindHack Academy. All rights reserved.
//

import Foundation
import UIKit

class FormViewController: ViewController {
    @IBOutlet weak var technologySegmentedController: UISegmentedControl!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet weak var tchnonolgySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var contactdateDatePicker: UIDatePicker!
    override func viewWillAppear(_ animated: Bool) {
        print("FormViewController wieWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
       print ("FormViewController viwDidAppear")
        
    }
    
    override func viewDidLoad() {
        print ("FormViewController viwDidLoad")
        let jsonString = """
{
"firstName": "John",
"lastName": "Doe",
"phone": "+40744555555",
"email": "john.doe@email.me"
}
"""
        
    
        
        
        let jsonData = jsonString.data(using: .utf8)!
        
        let user = try! JSONDecoder().decode(User.self, from: jsonData)
        
        print(user.lastName)
        
        
        
        
    }
    
    
    @IBAction func nextbuttonpresed(_ sender: Any) {
        var user = User ()
        user.firstName = self.nameTextField.text
        user.email = self.emailTextField.text
//        user.phone = self.phoneTextField.text
        user.date = self.contactdateDatePicker.date
        
        
        
        let jsondata = try! JSONEncoder().encode(user)
        let jsonString = String(data: jsondata, encoding: .utf8)!
        
        UserDefaults.standard.set(jsonString, forKey: "collectedData")
        
        

        
        
        print(jsonString)
        
    }
    
    @IBAction func technologySegmentedControllerValeueChanged(_ sender: Any) {
        let technologyArray: [String] = ["IOS", "ANDROID"]
        
        
        
    let segmentedController = sender as! UISegmentedControl
        
        let index = segmentedController.selectedSegmentIndex

                
        
        print("value = \(technologyArray[index])")
    }
}
