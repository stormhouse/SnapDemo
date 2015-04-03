//
//  SemiCircleMenuDemoController.swift
//  SnapDemo
//
//  Created by stormhouse on 4/3/15.
//  Copyright (c) 2015 stormhouse. All rights reserved.
//

import UIKit
import Snap

class SemiCircleMenuDemoController: UIViewController, SemiCircleMenuDelegate {
    
    var menu: SemiCircleMenu!
    var menuButtonItems: Array<Dictionary<String, String>> = [
        ["img1": "nav-click.png", "img2": "nav-clicked.png"],
        ["img1": "nav-click.png", "img2": "nav-clicked.png"],
        ["img1": "nav-click.png", "img2": "nav-clicked.png"],
        ["img1": "nav-click.png", "img2": "nav-clicked.png"],
//        ["img1": "dropbox.png", "img2": "dropbox.png"],
    ]
    
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //菜单
        menu = SemiCircleMenu(buttonItems: menuButtonItems)
        view.addSubview(menu)
        menu.delegate = self
        
//        menu.snp_makeConstraints { make in
//            make.edges.equalTo(self.view.snp_edges)
//            return
//        }
        menu.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(
            item: menu,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0
            ))
        view.addConstraint(NSLayoutConstraint(
            item: menu,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 0
            ))
        view.addConstraint(NSLayoutConstraint(
            item: menu,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 50
            ))
        view.addConstraint(NSLayoutConstraint(
            item: menu,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0
            ))

        
        label = UILabel()
        label.text = "ll"
        view.addSubview(label)
        label.snp_makeConstraints { make in
            make.center.equalTo(self.view).offset(CGPointMake(-5, 10))
//            make.center.equalTo(self.view.snp_center)
//            make.centerY.equalTo(self.view.snp_centerY)
            return
        }
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.menu.updateMenuConstraints()
    }
    
    
    func didTapMenuItem(index: Int){
        label.text = "\(index)"
        println(UIDevice.currentDevice().orientation.isLandscape)
        println(UIScreen.mainScreen().bounds)
    }

}
