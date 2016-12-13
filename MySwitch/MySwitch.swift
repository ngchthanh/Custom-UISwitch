//
//  MySwitch.swift
//  MySwitch
//
//  Created by Nguyen Chi Thanh on 12/12/16.
//  Copyright © 2016 Nguyen Chi Thanh. All rights reserved.
//

import UIKit

protocol MySwitchDelegate {
    func MySwitchDidChangeValue(mySwitch: MySwitch)
}

class MySwitch: UIView {

    var delegate: MySwitchDelegate?
    
    var imageSwitch: UIImageView!
    var leftLabel: UILabel!
    var rightLabel: UILabel!
    var OnImage: UIImage?
    var OffImage: UIImage?
    var OnColor: UIColor?
    var OffColor: UIColor?
    
    var rotateAnimation: Bool!
    
    private(set) var isOn: Bool!
    
    init(size: CGSize, isOn: Bool?, isCorner: Bool?, rotateAnimation: Bool, OnImg: UIImage?, OffImg: UIImage?, OnColor: UIColor?, OffColor: UIColor?) {
        super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.clipsToBounds = true
        self.rotateAnimation = rotateAnimation
        self.isOn = isOn ?? false
        self.OnImage = OnImg
        self.OffImage = OffImg
        self.OnColor = OnColor
        self.OffColor = OffColor
        
        leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width * 0.5, height: self.frame.height))
        leftLabel.text = "Off"
        leftLabel.textAlignment = .center
        self.addSubview(leftLabel)
        
        rightLabel = UILabel(frame: CGRect(x: self.frame.width * 0.5, y: 0, width: self.frame.width * 0.5, height: self.frame.height))
        rightLabel.text = "On"
        rightLabel.textAlignment = .center
        self.addSubview(rightLabel)
        
        if isOn == false {
            imageSwitch = UIImageView(frame: CGRect(x: self.frame.width * 0.5 + 1, y: 1, width: self.frame.width * 0.5 - 2, height: self.frame.height - 2))
            self.backgroundColor = OffColor
            imageSwitch.image = OffImg
            self.backgroundColor = OffColor ?? UIColor.green
        } else {
            imageSwitch = UIImageView(frame: CGRect(x: 1, y: 1, width: self.frame.width * 0.5 - 2, height: self.frame.height - 2))
            self.backgroundColor = OnColor
            imageSwitch.image = OnImg
            self.backgroundColor = OnColor ?? UIColor.lightGray
        }
        imageSwitch.backgroundColor = UIColor.white
        self.addSubview(imageSwitch)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
        if isCorner! {
            self.layer.cornerRadius = self.frame.height / 2
            imageSwitch.layer.cornerRadius = self.frame.height / 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setOn(isOn: Bool) {
        if isOn != self.isOn {
            self.isOn = isOn
            animationSwitcher()
        } else {
            self.isOn = isOn
        }
    }
    func handleTap(_ sender: UITapGestureRecognizer) {
        print("tap")
        isOn = !isOn
        self.animationSwitcher()
    }
    
    
    func animationSwitcher() {
        self.isUserInteractionEnabled = false
        if isOn == true {
            print("On")
            if self.rotateAnimation == true {
                imageSwitch.layer.add(rotateAnimation(Pi: -M_PI*2), forKey: nil)
            }
            UIView.transition(with: imageSwitch, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                self.imageSwitch.image = self.OnImage ?? self.imageSwitch.image
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.imageSwitch.frame.origin = CGPoint(x: 1, y: 1)
                self.backgroundColor = self.OnColor ?? self.backgroundColor
            }, completion:  { (_) in
            })

        } else {
            print("Off")
            if self.rotateAnimation == true {
                self.imageSwitch.layer.add(rotateAnimation(Pi: M_PI*2), forKey: nil)
            }

            UIView.transition(with: imageSwitch, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                self.imageSwitch.image = self.OffImage ?? self.imageSwitch.image
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.imageSwitch.frame.origin = CGPoint(x: self.frame.width * 0.5 + 1 , y: 1)
                self.backgroundColor = self.OffColor ?? self.backgroundColor
            }, completion: { (_) in
            })
            
        }
        self.isUserInteractionEnabled = true
    }
    
    func rotateAnimation(Pi: Double) -> CABasicAnimation {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = Pi
        rotateAnimation.duration = 0.5
        rotateAnimation.isCumulative = false
        return rotateAnimation
    }

}
