//
//  RootViewController.swift
//  iosApp
//
//  Created by derek on 2023/3/30.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit
import common
class RootViewController : UIViewController,LoginDelegate, LifeCycleDelegate {
    func changeState(callback: @escaping (String) -> Void) {
        
        
    }
    
    
//    override func viewDidLoad() {
//
//        FlightClickCenter.shared.setupClickDelegate { jumpUrl in
//                NSLog(" 需要跳转---%@", jumpUrl);
//            };
//        self.navigationController?.navigationBar.backgroundColor = UIColor.red;
//        self.view.backgroundColor = UIColor.white
//        let buttonNames = ["composevc","ktview","ktvc","城市列表页","二屏","单个图片测试——Compose","单个图片测试——Native","手动GC"];
//        var yCrood = 100;
//        for  i in 0 ... buttonNames.count-1 {
//            let button = UIButton(frame: CGRectMake(15, CGFloat(yCrood), UIScreen.main.bounds.size.width - 30, 40))
//            button.tag = i;
//            button.setTitle(String(format: "点击:%@", buttonNames[i]), for: UIControl.State.normal)
//            button.backgroundColor = UIColor.blue
//            button.addTarget(self, action:#selector(buttonAction(_:)), for: .touchUpInside)
//            yCrood += 50;
//            self.view.addSubview(button)
//        }
//
//        let button1 = UIButton(frame: CGRectMake(15, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0, 40))
//        button1.setTitle(lazyButtonTitle(), for: UIControl.State.normal)
//        button1.addTarget(self, action:#selector(lazyAction(_:)), for: .touchUpInside)
//        button1.backgroundColor = UIColor.blue
//        let button2 = UIButton(frame: CGRectMake((UIScreen.main.bounds.size.width - 60)/2.0+15+30, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0 , 40))
//        button2.setTitle(autoScrollButtonTitle(), for: UIControl.State.normal)
//        button2.backgroundColor = UIColor.blue
//        button2.addTarget(self, action:#selector(autoScrollAction(_:)), for: .touchUpInside)
//        self.view.addSubview(button1)
//        self.view.addSubview(button2)
//
//        yCrood += 50;
//
//        let button3 = UIButton(frame: CGRectMake(15, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0, 40))
//        button3.setTitle(openImageTitle(), for: UIControl.State.normal)
//        button3.addTarget(self, action:#selector(openImageAction(_:)), for: .touchUpInside)
//        button3.backgroundColor = UIColor.blue
//        self.view.addSubview(button3)
//
//
//        let button4 = UIButton(frame: CGRectMake((UIScreen.main.bounds.size.width - 60)/2.0+15+30, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0 , 40))
//        button4.setTitle(openLocalImageTitle(), for: UIControl.State.normal)
//        button4.addTarget(self, action:#selector(openLocalImageAction(_:)), for: .touchUpInside)
//        button4.backgroundColor = UIColor.blue
//        self.view.addSubview(button4)
//
//
//        yCrood += 50;
//
//        let button5 = UIButton(frame: CGRectMake(15, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0, 40))
//        button5.setTitle(openNativeImageTitle(), for: UIControl.State.normal)
//        button5.addTarget(self, action:#selector(openNativeImageAction(_:)), for: .touchUpInside)
//        button5.backgroundColor = UIColor.blue
//        self.view.addSubview(button5)
//
//
////        let button4 = UIButton(frame: CGRectMake((UIScreen.main.bounds.size.width - 60)/2.0+15+30, CGFloat(yCrood),(UIScreen.main.bounds.size.width - 60)/2.0 , 40))
////        button4.setTitle(openLocalImageTitle(), for: UIControl.State.normal)
////        button4.addTarget(self, action:#selector(openLocalImageAction(_:)), for: .touchUpInside)
////        button4.backgroundColor = UIColor.blue
////        self.view.addSubview(button4)
//
//
//    }
//    func lazyButtonTitle() -> String{
//        let title = MockCenter.shared.openLazy ? "懒加载" : "普通加载"
//        return title
//    }
//
//    func autoScrollButtonTitle() -> String{
//        let title = MockCenter.shared.autoScroll ? "自动滚动" : "不自动滚动"
//        return title
//    }
//
//    func openImageTitle() -> String{
//        let title = MockCenter.shared.openImageLoad ? "加载图片" : "不加载图片"
//        return title
//    }
//
//
//    func openLocalImageTitle() -> String{
//        let title = MockCenter.shared.openLocalImage ? "加载本地图片" : "加载网络图片"
//        return title
//    }
//
//    func openNativeImageTitle() -> String{
//        let title = MockCenter.shared.openNativeImage ? "Native" : "Compose-Image"
//        return title
//    }
//
//
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
//    override func viewWillDisappear(_ animated: Bool) {
////        self.navigationController?.isNavigationBarHidden = true
//    }
//    @objc func lazyAction(_ button:UIButton) {
//        MockCenter.shared.openLazy = !MockCenter.shared.openLazy
//        button.setTitle(lazyButtonTitle(), for: UIControl.State.normal)
//    }
//
//    @objc func autoScrollAction(_ button:UIButton) {
//        MockCenter.shared.autoScroll = !MockCenter.shared.autoScroll
//        button.setTitle(autoScrollButtonTitle(), for: UIControl.State.normal)
//    }
//
//    @objc func openImageAction(_ button:UIButton) {
//        MockCenter.shared.openImageLoad = !MockCenter.shared.openImageLoad
//        button.setTitle(openImageTitle(), for: UIControl.State.normal)
//    }
//
//    @objc func openLocalImageAction(_ button:UIButton) {
//        MockCenter.shared.openLocalImage = !MockCenter.shared.openLocalImage
//        button.setTitle(openLocalImageTitle(), for: UIControl.State.normal)
//    }
//
//    @objc func openNativeImageAction(_ button:UIButton) {
//        MockCenter.shared.openNativeImage = !MockCenter.shared.openNativeImage
//        button.setTitle(openNativeImageTitle(), for: UIControl.State.normal)
//    }
//
//
//    @objc func buttonAction(_ button:UIButton) {
//
//        var onceImageNative:UIViewController? = nil
//        if (button.tag == 0){
//            let mainViewController = UIManagerKt.showComposeDemoUI(delegate: self)
//            self.navigationController?.pushViewController(mainViewController, animated: true)
//        }else if(button.tag == 1){
//            let secondVC = SecondViewController()
//            self.navigationController?.pushViewController(secondVC, animated: true)
//        }else if(button.tag == 2){
//
//            let thirdVC = KTViewControllerKt.testViewViewController()
//            self.navigationController?.pushViewController(thirdVC, animated: true)
//        }else if(button.tag == 3){
//            let cityMainVC = UIManagerKt.showCityMainVC()
//            self.navigationController?.pushViewController(cityMainVC, animated: true)
////            self.navigationController?.present(cityMainVC, animated: true)
//        }else if(button.tag == 4){
//            let secondView = UIManagerKt.secondView(lifeCycleDelegate: self);
//            self.navigationController?.pushViewController(secondView, animated: true)
////            self.navigationController?.present(secondView, animated: true)
//        }else if(button.tag == 5){
//            let onceImage = UIManagerKt.onceImageTest(imageUrl:"https://pic.c-ctrip.com/pic/AssetCatalog/app/index/topList/newbanner.png",width:100.0,height:100.0);
//            self.navigationController?.pushViewController(onceImage, animated: true)
////            self.navigationController?.present(secondView, animated: true)
//        }
//        else if(button.tag == 6){
//            onceImageNative = OnceImageNativeViewController()
//            self.navigationController?.pushViewController(onceImageNative!, animated: true)
////            self.navigationController?.present(secondView, animated: true)
//        }
//        else if(button.tag == 7){
//            //            UIManagerKt.GCTest()
//            onceImageNative = nil;
//            onceImageNative?.view?.subviews.forEach({ subView in
//                subView.removeFromSuperview()
//            })
////            self.navigationController?.present(secondView, animated: true)
//        }
//
//    }
//
//
//
//    func secondAction(info: String) -> String? {
//        NSLog("点击了%@--：Native响应", info)
//        return String.init(format: "native-back:%@", info)
//    }
    
}
