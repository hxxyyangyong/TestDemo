//
//  OnceImageNativeViewController.swift
//  iosApp
//
//  Created by derek on 2023/7/11.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit
class OnceImageNativeViewController : UIViewController {
    override func viewDidLoad() {
        let imageView = UIImageView.init(frame: CGRectMake(0, 0, 100, 100));
        imageView.image = UIImage.init(named: "topListnewbanner.png")
        self.view.addSubview(imageView)
        
    }
}
