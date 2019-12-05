//
//  ListViewController.swift
//  LeadCollector
//
//  Created by MindHack Academy on 21/11/2019.
//  Copyright © 2019 MindHack Academy. All rights reserved.
//

import Foundation

import UIKit

class ListViewController: ViewController, UITableViewDataSource,

    UITableViewDelegate
    
    
{
    
    @IBOutlet weak var listTableView: UITableView!
    var propertiesArray: [String] = []
    var propertiesDictionary: [String: String] = [:] 
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
   
        let  jsonString = UserDefaults.standard.string(forKey: "collectedData")
        let jsonData = (jsonString?.data(using: .utf8))!
        let user = try! JSONDecoder().decode(User.self, from: jsonData)
        
        print(user)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: user.date!)
        
        
        
        propertiesArray = ["First Name",
                           "Last Name",
                           "Email",
                           "Phone",
                           "Date"]
        
        propertiesDictionary = [propertiesArray[0]: user.firstName!,
                                propertiesArray[1]: "Doe",
                                propertiesArray[2]: user.email!,
                                propertiesArray[3]: "0",
                                propertiesArray[4]: dateString]
        
        
        
//        let formatter = DateFormatter()
        
        
        
        
        print("ListViewController wieWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
       print ("ListViewController viwDidAppear")
        
    }
    
    override func viewDidLoad() {
        
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
        
        
        print ("ListViewController viwDidLoad")
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.propertiesArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let  currentProperty = self.propertiesArray[indexPath.item]
        let currentUserData = self.propertiesDictionary[currentProperty]
        cell.textLabel?.text = currentProperty
        cell.detailTextLabel?.text = currentUserData
        
        
        
        return cell
    }
    
    
}



