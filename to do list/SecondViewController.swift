//
//  SecondViewController.swift
//  to do list
//
//  Created by Vyom Unadkat on 20/08/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate ,UIApplicationDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBOutlet weak var addTask: UITextField!
    
    
    @IBAction func submit(_ sender: AnyObject) {
        var testvar = [String]()
        
        var data = UserDefaults.standard.object(forKey: "items")
        
        if let temp = data as? [String?]
        {
            testvar = temp as! [String]
            testvar.append(addTask.text!)
        }
        else{
            testvar = [addTask.text!]
        }
        
        UserDefaults.standard.set( testvar, forKey: "items")
        addTask.text = ""
    }
    
    
}

