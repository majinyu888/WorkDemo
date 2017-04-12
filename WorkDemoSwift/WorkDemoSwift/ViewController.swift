//
//  ViewController.swift
//  WorkDemoSwift
//
//  Created by hb on 2017/1/9.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    let myView = UIView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        myView.layer.position = CGPoint(x: 100, y: 100)
        //        myView.layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        myView.backgroundColor = UIColor.blue
        //        view.addSubview(myView)
        
        
        ///       平移方式 2 种
        
        //        let anim = CABasicAnimation(keyPath: "position")
        //        anim.duration = 1.5
        //        anim.fromValue = NSValue(cgPoint: CGPoint(x: 50, y: 80))
        //        anim.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 350))
        //        anim.delegate = self
        //        anim.isRemovedOnCompletion = false
        //        anim.fillMode = kCAFillModeForwards
        //        myView.layer.add(anim, forKey: "translate")
        
        //        let anim = CABasicAnimation(keyPath: "transform")
        //        anim.duration = 1
        //        let form = CATransform3DMakeTranslation(350, 350, 0)
        //        anim.toValue = NSValue(caTransform3D: form)
        //        anim.isRemovedOnCompletion = false
        //        anim.fillMode = kCAFillModeForwards
        //        anim.delegate = self
        //        myView.layer.add(anim, forKey: nil)
        
        
        ///       缩放方式 2 种
        
        //        let anim = CABasicAnimation(keyPath: "bounds")
        //        anim.duration = 2
        //        anim.delegate = self
        //        anim.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 30, height: 30))
        //        myView.layer.add(anim, forKey: nil)
        
        //        let anim = CABasicAnimation(keyPath: "transform")
        //        anim.duration = 1.5
        //        anim.fromValue = NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1))
        //        anim.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 1.5, 1))
        //        myView.layer.add(anim, forKey: nil)
        
        ///       旋转方式 1 种
        
        //        let anim = CABasicAnimation(keyPath: "transform")
        //        anim.duration = 1.5
        //        anim.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Double.pi/4), 0, 0, 1))
        //        myView.layer.add(anim, forKey: nil)
        
        //        let myLayer =  CALayer()
        //        myLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        myLayer.borderColor = UIColor.gray.cgColor
        //        myLayer.borderWidth = 1.0
        //        myLayer.position = CGPoint(x: 100, y: 100)
        //        myLayer.anchorPoint = CGPoint(x: 0, y: 0)
        //        myLayer.backgroundColor = UIColor.red.cgColor
        //        view.layer.addSublayer(myLayer)
        
        
        let replicator = CAReplicatorLayer()
        replicator.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        replicator.cornerRadius = 10
        replicator.position = view.center
        replicator.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2).cgColor
        view.layer.addSublayer(replicator)
        
        let dotWidth = CGFloat(15)
        let dotSpace = CGFloat(15)
        let dotCount = 3
        
        let dot = CALayer()
        dot.bounds = CGRect(x: 0, y: 0, width: dotWidth, height: dotWidth)
        dot.position = CGPoint(x: dotSpace, y: replicator.frame.size.height/2)
        dot.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.5).cgColor
        dot.cornerRadius = dotWidth/2.0
        dot.transform = CATransform3DMakeScale(0, 0, 0)
        
        let anim = CABasicAnimation(keyPath: "transform.scale")
        anim.duration = 2.0
        anim.fromValue = 1
        anim.toValue = 0
        anim.repeatCount = Float.infinity
        dot.add(anim, forKey: nil)
        replicator.addSublayer(dot)
        
        replicator.instanceCount = dotCount
        replicator.instanceDelay = 1.0/3
        replicator.instanceTransform = CATransform3DMakeTranslation(replicator.frame.size.width/3, 0, 0)
        
        
    }
    
    
    
    
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始执行了")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画执行完毕了, \(myView.layer.position)")
    }
}

