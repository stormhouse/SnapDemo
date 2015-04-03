//
//  ViewController.swift
//  SnapDemo
//
//  Created by stormhouse on 3/27/15.
//  Copyright (c) 2015 stormhouse. All rights reserved.
//

import UIKit
import Snap
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView   : UITableView?
    var items       : NSArray?
    
    var addrView: UIView!
    var button: UIButton!
    var addrText: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "stormhouse"
        self.items = ["Snap", "SemiCircleMenu"]
        
        self.tableView = UITableView(frame:self.view.frame, style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
        
        /*
        button = UIButton.buttonWithType(.System) as? UIButton
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Press Me", forState: .Normal)
        button.setTitle("I'm Pressed", forState: .Highlighted)
*/
//        button.addTarget(self, action: "buttonIsPressed:", forControlEvents: .TouchDown)
//        button.addTarget(self, action: "buttonIsTapped:", forControlEvents: .TouchUpInside)
        //        button.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
        
//        button.snp_makeConstraints { make in
//            make.center.equalTo(self.view).offset(CGPointMake(-5, 10))
//            return // this return is a fix for implicit returns in Swift and is only required for single line constraints
//        }
        
//        addrView = UIView()
//        addrView.backgroundColor = UIColor.brownColor()
//        view.addSubview(addrView)
//        addrView.snp_makeConstraints{ make in
//            make.height.equalTo(60)
//            make.width.equalTo(self.view)
//        }
//        
//        addrText = UITextField()
//        addrText.text = "search"
//        addrText.backgroundColor = UIColor.whiteColor()
//        addrView.addSubview(addrText)
//        addrText.snp_makeConstraints{ make in
//            make.height.equalTo(30)
//            make.edges.equalTo(self.addrView).insets(UIEdgeInsetsMake(20, 10, 10, 10))
////            make.size.equalTo(self.addrView).offset(CGSizeMake(10, 10))
//            return
//        }


        
    }
    
    // UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
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
        
            case "Snap":
                var snapViewController = SnapViewController()
//                var rootNavigationController = UINavigationController(rootViewController: snapViewController)
//                rootNavigationController.title = title
                self.navigationController!.pushViewController(snapViewController, animated: true)
            case "SemiCircleMenu":
                var detailViewController = SemiCircleMenuDemoController()
                detailViewController.title = title
                self.navigationController!.pushViewController(detailViewController, animated: true)
            
            default:
                return
        }
        
    }

}

