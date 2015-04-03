//
//  SnapViewController.swift
//  SnapDemo
//
//  Created by stormhouse on 4/3/15.
//  Copyright (c) 2015 stormhouse. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView   : UITableView?
    private var items       : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "SnapDemo"
        self.items = ["Center", "Absolute"]
        
        self.tableView = UITableView(frame:self.view.frame, style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
 
    }
    
    // UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.items?.objectAtIndex(indexPath.row) as String!
        
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        var title = self.items?.objectAtIndex(indexPath.row)  as String!
        switch title {
            
        case "Center":
            var centerViewController = CenterViewController()
            self.navigationController!.pushViewController(centerViewController, animated: true)
            
        default:
            return
        }
        
    }
}
