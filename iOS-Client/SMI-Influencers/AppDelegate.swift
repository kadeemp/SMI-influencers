//
//  AppDelegate.swift
//  SMI-Influencers
//
//  Created by Kadeem Palacios on 4/11/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import TwitterKit
import Fabric
import Crashlytics
import KeychainSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let keychain = KeychainSwift()
    var tokenA:String? = nil
    var tokenB:String? = nil
    var tokenC:String? = nil
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
       // let AnalyticsViewController = storyboard.instantiateViewController(withIdentifier: "AnalyticsVC")
        let LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        let Nav = storyboard.instantiateViewController(withIdentifier: "NavVC")
        
        try tokenA = keychain.get("FBToken")
        if  tokenA != nil {
            
            self.window?.rootViewController = Nav
//            self.window?.rootViewController = LoginViewController
            self.window?.makeKeyAndVisible()
        
        } else {
            self.window?.rootViewController = LoginViewController
            self.window?.makeKeyAndVisible()
        }
        

        //Fabric.with([Twitter.self, Crashlytics.self])


        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //customize the navigation controller
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationBarAppearance.barTintColor = UIColor(red: 20/255, green: 20/255, blue: 21/255, alpha: 1)
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent


        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

