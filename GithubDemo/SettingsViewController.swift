//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Dave Vo on 9/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

@objc protocol SettingsViewControllerDelegate {
    optional func filtersViewController(filFiltersViewController: SettingsViewController, didUpdateFilters filters: [String:AnyObject])
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SliderCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: SettingsViewControllerDelegate?
    
    var filters = [String : AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSaveButton(sender: AnyObject) {
        
        
        
        
        
        
        dismissViewControllerAnimated(true, completion: nil)
       
        
    }
    
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            break
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SliderCell", forIndexPath: indexPath) as! SliderCell
        
        cell.delegate = self
        
        
        return cell
    }
    
    func switchCell(switchCell: SliderCell, didChangeValue value: Float) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        if indexPath.section == 0 {
            self.filters["star"] = value
            println(self.filters["star"])
        } else if indexPath.section == 1 {
//            switchStates[indexPath.row] = value
            //        println("filters view controller got the switch event")
        }
        
    }
    
        

}
