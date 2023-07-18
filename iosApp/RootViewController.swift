//
//  RootViewController.swift
//  iosApp
//
//  Created by derek on 2023/7/14.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit
import common
class RootViewController : UIViewController {
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.red;
        self.view.backgroundColor = UIColor.white
        let buttonNames = ["Composevc-image","Composevc-none-image","Native vc","present"];
        var yCrood = 100;
        for  i in 0 ... buttonNames.count-1 {
            let button = UIButton(frame: CGRectMake(15, CGFloat(yCrood), UIScreen.main.bounds.size.width - 30, 40))
            button.tag = i;
            button.setTitle(String(format: "Click To:%@", buttonNames[i]), for: UIControl.State.normal)
            button.backgroundColor = UIColor.blue
            button.addTarget(self, action:#selector(buttonAction(_:)), for: .touchUpInside)
            yCrood += 50;
            self.view.addSubview(button)
        }
        
    }
    @objc func buttonAction(_ button:UIButton) {
        
        if (button.tag == 0){
            let mainViewController = Platform_iosKt.onceImageTest(needShowImage: true,lifeCycleDelegate: nil)
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        else if (button.tag == 1){
            let mainViewController = Platform_iosKt.onceImageTest(needShowImage: false,lifeCycleDelegate: nil)
            self.navigationController?.pushViewController(mainViewController, animated: true)
        }else if (button.tag == 2){
            let abcViewController = AbcViewController()
            self.navigationController?.pushViewController(abcViewController, animated: true)
        }else if (button.tag == 3){
            let mainViewController = Platform_iosKt.onceImageTest(needShowImage: false,lifeCycleDelegate: nil)
            self.present(mainViewController, animated: false)
        }
        
    }
}
