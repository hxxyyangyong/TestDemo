//
//  UIViewController+SS.m
//  TestlifeCycle
//
//  Created by derek on 2023/6/30.
//

#import "UIViewController+SS.h"
#import <objc/runtime.h>
#import "LifeCycleManager.h"

static void swizzle_preSearchStat_method(Class class, SEL originalSEL, SEL swizzledSEL) {
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSEL,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIViewController (SS)

#pragma mark - Swizzle

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class swizzleClass = [UIViewController class];
        
        
        swizzle_preSearchStat_method(swizzleClass, @selector(viewDidLoad),
                                     @selector(swizzled_preSearchStat_viewDidLoad));
        
        swizzle_preSearchStat_method(swizzleClass, @selector(viewWillAppear:),
                                     @selector(swizzled_preSearchStat_viewWillAppear:));
        
        swizzle_preSearchStat_method(swizzleClass, @selector(viewDidAppear:),
                                     @selector(swizzled_preSearchStat_viewDidAppear:));
        
        
        swizzle_preSearchStat_method(swizzleClass, @selector(viewWillDisappear:), @selector(swizzled_preSearchStat_viewWillDisappear:));
        
        
        swizzle_preSearchStat_method(swizzleClass, @selector(viewDidDisappear:), @selector(swizzled_preSearchStat_viewDidDisappear:));
        swizzle_preSearchStat_method(swizzleClass, NSSelectorFromString(@"dealloc"), @selector(swizzled_preSearchStat_dealloc));
        
    });
}

- (void)swizzled_preSearchStat_dealloc
{
//    [self swizzled_preSearchStat_dealloc];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        NSLog(@"---%@",@"ComposeWindow ViewController - dealloc");
    }else{
        NSLog(@"---%@",@"Old Native ViewController- dealloc");
    }
}



- (void)swizzled_preSearchStat_viewDidLoad
{
    [self swizzled_preSearchStat_viewDidLoad];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        [LifeCycleManager viewDidLoad];
        
    }
}

- (void)swizzled_preSearchStat_viewWillAppear:(BOOL) animated {
    [self swizzled_preSearchStat_viewWillAppear:animated];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        [LifeCycleManager viewWillAppear];
    }
}

- (void)swizzled_preSearchStat_viewDidAppear:(BOOL) animated {
    [self swizzled_preSearchStat_viewDidAppear:animated];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        [LifeCycleManager viewDidAppear];
    }
}

- (void)swizzled_preSearchStat_viewWillDisappear:(BOOL) animated {
    [self swizzled_preSearchStat_viewWillDisappear:animated];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        [LifeCycleManager viewWillDisAppear];
    }
}

- (void)swizzled_preSearchStat_viewDidDisappear:(BOOL) animated {
    [self swizzled_preSearchStat_viewDidDisappear:animated];
    NSLog(@"---%@",[self class]);
    if([self isCompose]){
        [LifeCycleManager viewDidDisAppear];
    }
}

- (BOOL)isCompose
{
    return [NSStringFromClass(self.class) isEqualToString:@"ComposeWindow"];
}
@end

