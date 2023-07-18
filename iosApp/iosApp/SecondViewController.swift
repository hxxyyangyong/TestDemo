//
//  SecondViewController.swift
//  iosApp
//
//  Created by derek on 2023/3/30.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit
import shared
class SecondViewController : UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white;
        let ktView = KTViewControllerKt.testView()
//        ktView?.backgroundColor = UIColor.red
        ktView?.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        if((ktView) != nil){
            self.view.addSubview(ktView!)
        }
        
        let ktView2 = KTViewControllerKt.testView2()
//        ktView?.backgroundColor = UIColor.red
        ktView2.frame = CGRect(x: 0, y: 210, width: 100, height: 100)
        self.view.addSubview(ktView2)
        
        
        let ktView3 = PlatformKt.getView {  it in
            NSLog("go:%@", it)
        } back: {
            return "bbbb"
        } as! UIView

        ktView3.frame = CGRect(x: 0, y: 320, width: 100, height: 100)
        self.view.addSubview(ktView3)
    }
    
}
