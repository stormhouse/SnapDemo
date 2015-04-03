//
//  SemiCircleMenu.swift
//  SnapDemo
//
//  Created by stormhouse on 4/1/15.
//  Copyright (c) 2015 stormhouse. All rights reserved.
//

import UIKit

let radius = 120.0
let side = 50.0

protocol SemiCircleMenuDelegate{
    func didTapMenuItem(index: Int)
}
class MenuItemButton: UIButton {
    var index: Int!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(index: Int){
        super.init()
        self.index = index
    }

}

class SemiCircleMenu: UIView {
    
    var delegate: SemiCircleMenuDelegate!
    
    var navImage1: UIImage? = UIImage(named:"nav-click.png")
    var navImage2: UIImage? = UIImage(named:"nav-clicked.png")

    
    let mainButton: UIButton!
    let buttonItems: Array<MenuItemButton>!
    
    var mainButtonRecognizer: UIPanGestureRecognizer!
    
    var expand: Bool = false
    var left: Bool = true
    var x: CGFloat = 16
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(buttonItems btnItems: Array<Dictionary<String, String>>) {
        super.init()
        self.clipsToBounds = false
        self.mainButton = UIButton()
        self.buttonItems = Array<MenuItemButton>()
        for (index, item) in enumerate(btnItems) {
            var img1: UIImage? = UIImage(named: item["img1"]!)
            var img2: UIImage? = UIImage(named: item["img2"]!)
            var btn = MenuItemButton(index: index)
            btn.hidden = true
            btn.setBackgroundImage(img1, forState: UIControlState.Normal)
//            btn.setBackgroundImage(img2, forState: UIControlState.Highlighted)
            btn.addTarget(self, action: "itemTapHandler:", forControlEvents: .TouchUpInside)
            self.buttonItems.append(btn)
            self.addSubview(btn)
        }
        
        mainButtonRecognizer = UIPanGestureRecognizer(target: self, action: "mainButtonHandle:")
        mainButtonRecognizer.minimumNumberOfTouches = 1
        mainButtonRecognizer.maximumNumberOfTouches = 1
        
        mainButton.addGestureRecognizer(mainButtonRecognizer)
        
        createMenu()
        updateMenuConstraints()
    }
    
    func createMenu(){
        //self 添加约束(自己不能决定自己的定义，在它的父级view中添加它的 约束)
        
        mainButton.setBackgroundImage(navImage1, forState:UIControlState.Normal)
        mainButton.setBackgroundImage(navImage2, forState: UIControlState.Highlighted)
        mainButton.addTarget(self, action: "buttonIsTapped:", forControlEvents: .TouchUpInside)
    
        addSubview(mainButton)
    }

    
    func itemTapHandler(sender: MenuItemButton){
        updateMenu()
        delegate.didTapMenuItem(sender.index!)
    }
    
    func buttonIsTapped(sender: UIButton){
        updateMenu()
    }
    
    func mainButtonHandle(sender: UIPanGestureRecognizer){
        if self.expand {
            return
        }
        if sender.state == .Began{
            self.x = sender.locationInView(sender.view!.superview!).x
        }
        
        if sender.state == .Ended {
            
            
            let location = sender.locationInView(sender.view!.superview!)
            if location.x > self.x {
                UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { _ in
                    self.mainButton.transform = CGAffineTransformMakeTranslation(UIScreen.mainScreen().bounds.width-50-32, 0)
                    }, completion: { _ in
                        self.left = false
                        self.updateMenuConstraints()
                })
                
            }else{
                UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { _ in
                    self.mainButton.transform = CGAffineTransformMakeTranslation(50+32-UIScreen.mainScreen().bounds.width, 0)
                    }, completion: { _ in
                        self.left = true
                        self.updateMenuConstraints()
                })
            }
        }
    }
    
    func updateMenuConstraints(){
        

        
        //mainButton snap约束
        //        mainButton.snp_makeConstraints { make in
        //            make.center.equalTo(self.snp_center)
        //            make.height.equalTo(side)
        //            make.width.equalTo(side)
        //            make.bottom.equalTo(-16)
        //            make.left.equalTo(16)
        //        }
        
        //mainButton 约束
//        mainButton.setTranslatesAutoresizingMaskIntoConstraints(false)
//        mainButton.addConstraint(NSLayoutConstraint(
//            item: mainButton,
//            attribute: NSLayoutAttribute.Height,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: nil,
//            attribute: NSLayoutAttribute.NotAnAttribute,
//            multiplier: 1,
//            constant: 50
//            ))
//        mainButton.addConstraint(NSLayoutConstraint(
//            item: mainButton,
//            attribute: NSLayoutAttribute.Width,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: nil,
//            attribute: NSLayoutAttribute.NotAnAttribute,
//            multiplier: 1,
//            constant: 50
//            ))
//        self.addConstraint(NSLayoutConstraint(
//            item: mainButton,
//            attribute: NSLayoutAttribute.Left,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: self,
//            attribute: NSLayoutAttribute.Left,
//            multiplier: 1,
//            constant: 16
//            ))
//        self.addConstraint(NSLayoutConstraint(
//            item: mainButton,
//            attribute: NSLayoutAttribute.Bottom,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: self,
//            attribute: NSLayoutAttribute.Bottom,
//            multiplier: 1,
//            constant: -16
//            ))
        
        mainButton.transform = CGAffineTransformIdentity
        if self.left {
            for button in buttonItems{
                button.snp_remakeConstraints { make in
                    make.width.equalTo(side)
                    make.height.equalTo(side)
                    make.bottom.equalTo(-16)
                    make.left.equalTo(16)
                }
            }
            mainButton.snp_remakeConstraints { make in
//                make.center.equalTo(self.snp_center)
                make.height.equalTo(side)
                make.width.equalTo(side)
                make.bottom.equalTo(-16)
                make.left.equalTo(16)
            }
        }else{
            for button in buttonItems{
                button.snp_remakeConstraints { make in
                    make.width.equalTo(side)
                    make.height.equalTo(side)
                    make.bottom.equalTo(-16)
                    make.right.equalTo(-16)
                }
            }
            mainButton.snp_remakeConstraints { make in
//                make.center.equalTo(self.snp_center)
                make.height.equalTo(side)
                make.width.equalTo(side)
                make.bottom.equalTo(-16)
                make.right.equalTo(-16)
            }
        }
    }
    
    func updateMenu(){
        if self.expand {
            mainButton.setBackgroundImage(navImage1, forState:UIControlState.Normal)
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { _ in
                for item in self.buttonItems{
                    item.transform = CGAffineTransformIdentity
                }
                
                }, completion: { _ in
                    self.expand = false
                    for item in self.buttonItems{
                        item.hidden = true
                    }
            })
        }else{
            mainButton.setBackgroundImage(navImage2, forState:UIControlState.Normal)
            for item in self.buttonItems{
                item.hidden = false
            }
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { _ in
                
                let num = self.buttonItems.count
                let degree: Double = 90.0 / Double(num-1)
                for (index, item) in enumerate(self.buttonItems) {
                    
                    let radian = degree * Double(index) * M_PI / 180.0
                    var x = CGFloat(Int((sin(radian) * radius)*100))/100
                    var y = -CGFloat(Int((cos(radian) * radius)*100))/100
                    
                    if !self.left{
                        x = -x
                    }
//                    println("x:\(x)----y:\(y)")
                    var t = CGAffineTransformMakeTranslation(x, y)
                    var s = CGAffineTransformMakeScale(1.1, 1.1)
                    item.transform = CGAffineTransformConcat(s, t)
                }
                
                }, completion: { _ in
                    self.expand = true
            })
        }
        
    }

    
    override func updateConstraints() {
        super.updateConstraints()
    }

}
