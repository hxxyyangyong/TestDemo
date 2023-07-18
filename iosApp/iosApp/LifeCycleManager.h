//
//  LifeCycleManager.h
//  TestlifeCycle
//
//  Created by derek on 2023/6/30.
//

#import <Foundation/Foundation.h>
#import <common/common.h>
NS_ASSUME_NONNULL_BEGIN

@interface LifeCycleManager : NSObject<CommonLifeCycleDelegate>

+ (instancetype)shareInstance;

+ (void)viewDidLoad;
+ (void)viewWillAppear;
+ (void)viewDidAppear;
+ (void)viewWillDisAppear;
+ (void)viewDidDisAppear;

@end

NS_ASSUME_NONNULL_END
