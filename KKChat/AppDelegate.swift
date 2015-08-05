//
//  AppDelegate.swift
//  KKChat
//
//  Created by jensen on 15/8/4.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//
//vnroth0krcsgo     fuzyAOwAucj
//{"code":200,"userId":"kellen","token":"yrY/B1l6RYKMORAYL+7AY0TPhYVEj5h6Z7vY8/kD0kCN7+UjSlG08TboUHIfxvEsfUe5fDbron20VLL/31oKYQ=="}

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //查询保存的token
        let deviceTokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey("vnroth0krcsgo")
        
        //用token测试连接
        RCIM.sharedRCIM().connectWithToken("yrY/B1l6RYKMORAYL+7AY0TPhYVEj5h6Z7vY8/kD0kCN7+UjSlG08TboUHIfxvEsfUe5fDbron20VLL/31oKYQ==", success: { (_) -> Void in
            println("连接成功")
        }, error: { (_) -> Void in
            println("连接失败")
        }) { () -> Void in
            println("token不正确，或已经失效")
        }
        
        let currentUser = RCUserInfo(userId: "kellen", name: "shen", portrait: "http://www.xiaoboswift.com/1.jpg")
        
        RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

