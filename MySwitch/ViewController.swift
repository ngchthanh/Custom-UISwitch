//
//  ViewController.swift
//  MySwitch
//
//  Created by Nguyen Chi Thanh on 12/12/16.
//  Copyright © 2016 Nguyen Chi Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let switch1 = MySwitch(size: CGSize(width: 60, height: 30), isOn: false, isCorner: false, rotateAnimation: false, OnImg: nil, OffImg: nil, OnColor: UIColor.blue, OffColor: UIColor.darkGray)
        switch1.frame.origin = CGPoint(x: 50, y: 50)
        view.addSubview(switch1)
        
        let switch2 = MySwitch(size: CGSize(width: 80, height: 40), isOn: false, isCorner: true, rotateAnimation: true, OnImg: #imageLiteral(resourceName: "On.png"), OffImg: #imageLiteral(resourceName: "Off.png"), OnColor: UIColor.blue, OffColor: UIColor.darkGray)
        switch2.frame.origin = CGPoint(x: 70, y: 100)
        view.addSubview(switch2)
        
        let switch3 = MySwitch(size: CGSize(width: 70, height: 35), isOn: false, isCorner: true, rotateAnimation: true, OnImg: #imageLiteral(resourceName: "Ok"), OffImg: #imageLiteral(resourceName: "Cancel"), OnColor: UIColor.yellow, OffColor: UIColor.lightGray)
        switch3.frame.origin = CGPoint(x: 50, y: 200)
        view.addSubview(switch3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

}

