//
//  LifeCycleManager.m
//  TestlifeCycle
//
//  Created by derek on 2023/6/30.
//

#import "LifeCycleManager.h"

typedef void(^composeCallBack)(NSString * _Nonnull);
@interface LifeCycleManager()
@property (nonatomic,copy) composeCallBack lifeCycleCallBack;
@end

@implementation LifeCycleManager

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static LifeCycleManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[LifeCycleManager alloc]init];
        
    });
    return manager;
}

+ (void)viewDidLoad
{
    [self backToCompose:@"viewDidLoad"];
}
+ (void)viewWillAppear
{
    [self backToCompose:@"viewWillAppear"];
}
+ (void)viewDidAppear
{
    [self backToCompose:@"viewDidAppear"];
}
+ (void)viewWillDisAppear
{
    [self backToCompose:@"viewWillDisAppear"];
}
+ (void)viewDidDisAppear
{
    [self backToCompose:@"viewDidDisAppear"];
}

+(void)backToCompose:(NSString *)tag
{
    if([LifeCycleManager shareInstance].lifeCycleCallBack){
        [LifeCycleManager shareInstance].lifeCycleCallBack(tag);
    }
}




- (void)changeStateCallback:(void (^)(NSString * _Nonnull))callback
{
    self.lifeCycleCallBack = callback;
}

@end
