//
//  FirstViewController.swift
//  to do list
//
//  Created by Vyom Unadkat on 20/08/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var table: UITableView!

    var testvar = [String]()
    
    override func viewDidLoad() {
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        var data = UserDefaults.standard.object(forKey: "items")
        
        if let temp = data as? [String?]
        {
            testvar = temp as! [String]
            
        }
        table.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return testvar.count
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            testvar.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(testvar, forKey: "items")
        }
    }
    
/*
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            numbers.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
*/
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let test = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        test.textLabel?.text = testvar[indexPath.row] 

        return test
        
    }
    
    



}

