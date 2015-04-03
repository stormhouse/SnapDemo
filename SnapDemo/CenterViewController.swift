//
//  CenterViewController.swift
//  SnapDemo
//
//  Created by stormhouse on 4/3/15.
//  Copyright (c) 2015 stormhouse. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        var label: UILabel = UILabel()
        label.text = "stormhouse"
        view.addSubview(label)
        
        label.snp_makeConstraints { make in
            make.center.equalTo(self.view)
            return
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
