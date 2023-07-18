//
//  VCReplace.swift
//  iosApp
//
//  Created by derek on 2023/6/30.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    class func swizzleViewDidLoad(){
        let originalSlector = #selector(UIViewController.viewDidLoad)
                let originalMethod = class_getInstanceMethod(UIViewController.self, originalSlector)!
                let originalImplementation = method_getImplementation(originalMethod)
                //id (*IMP)(id, SEL, ...)
                typealias originalClosureType = @convention(c) (AnyObject,Selector,String) -> Void
                let originalClosure:originalClosureType = unsafeBitCast(originalImplementation, to: originalClosureType.self)
                let newBlock:@convention(block)(AnyObject,String) -> Void = {
                    obj, name in
                    var name__ = name
                    name__ = name + ",nice to meet you"
                    return originalClosure(obj,originalSlector,name__)
                }
                    //Its signature should be: method_return_type ^(id self, method_args...).
                let newImplementation = imp_implementationWithBlock(unsafeBitCast(newBlock, to: AnyObject.self))
                print(newImplementation)
                method_setImplementation(originalMethod, newImplementation)
        
    }
    
}
