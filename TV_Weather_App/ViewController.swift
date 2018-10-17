//
//  ViewController.swift
//  TV_Weather_App
//
//  Created by Aaron Dougher on 10/8/18.
//  Copyright © 2018 Erin Dougher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newUrl = NSURL(string: "https://api.darksky.net/forecast/707832b21ca30e8b4edb6193c3885717/42.2411,-88.3162"){
        
        if let data = NSData(contentsOf: newUrl as URL){
            
            
            do {
                let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                
                let newDict = parsed
                print(newDict["currently"]!["summary"] as Any)
                print(newDict["currently"]!["temperature"] as Any)
                
                self.summary.text =  "\(newDict["currently"]!["summary"]!!)"
                
                self.temp.text = "\(newDict["currently"]!["temperature"]!!)"
                
                self.apparentTemp.text = "\(newDict["currently"]!["apparentTemperature"]!!)"
                
            }
            catch let error as NSError {
                print("A JSON parsing error occurred, here are the details:\n \(error)")
            }
        }
    }
    
    }

  
    
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var apparentTemp: UILabel!
}

