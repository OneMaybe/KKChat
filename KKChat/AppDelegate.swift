//
//  AppDelegate.swift
//  KKChat
//
//  Created by jensen on 15/8/4.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//
//vnroth0krcsgo     fuzyAOwAucj
//{"code":200,"userId":"kellen","token":"J2alovsWg7Q2o+qDqs9Xz4A3JeG/mS99Ort7Npj35iToOeW7DbXEAYnE4vV9SIe/C5fuoY3AI+QCjqXi/rVgHw=="}
//{"code":200,"userId":"kellen2","token":"d2QI1z8g+5JkJSnOyhbxNUTPhYVEj5h6Z7vY8/kD0kCt/R7RCp4bHSdaKpSMc8vTfUe5fDbron26rBuRNvN9MQ=="}
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
            case "kellen":
            userInfo.name = "shen"
            userInfo.portraitUri = "http://img4.imgtn.bdimg.com/it/u=2205791892,1328528914&fm=23&gp=0.jpg"
            case "kellen2":
                userInfo.name = "shen2"
                userInfo.portraitUri = "http://img4.imgtn.bdimg.com/it/u=646999347,2839297789&fm=111&gp=0.jpg"
        default:
            println("no user")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion:()->Void) {
        
        //查询保存的token
        let deviceTokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey("vnroth0krcsgo")
        
        //用token测试连接
        RCIM.sharedRCIM().connectWithToken("J2alovsWg7Q2o+qDqs9Xz4A3JeG/mS99Ort7Npj35iToOeW7DbXEAYnE4vV9SIe/C5fuoY3AI+QCjqXi/rVgHw==", success: { (str:String?) -> Void in
            
            let currentUser = RCUserInfo(userId: "kellen", name: "shen", portrait: "http://img4.imgtn.bdimg.com/it/u=646999347,2839297789&fm=111&gp=0.jpg")
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
            
            }, error: { (code:RCConnectErrorCode) -> Void in
                println("连接失败 \(code)")
            }) { () -> Void in
                println("token不正确，或已经失效")
        }
        
        
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //设置用户信息提供者为自己
        RCIM.sharedRCIM().userInfoDataSource = self
        
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

