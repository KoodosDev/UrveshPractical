//
//  AppDelegate.swift
//  TwitterDemo
//
//  Created by iMac on 08/07/21.
//  Copyright © 2021 iMac. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK:- Outlets and Variables
    var window: UIWindow?

    //MARK:- Application lifecycle delegate methods

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Twitter SDK with Consumer key and Consumer secret.
        TWTRTwitter.sharedInstance().start(withConsumerKey: "Sh4JYw4aQ773emLJTL9zlFFF2", consumerSecret: "KYZk6x2O0HO8e1ClUyqDDMjXOnYJhjwHBXrY4PJ6M7OFBxkE7z")

        //Twitter get existing session of twitter
        let arrUser = TWTRTwitter.sharedInstance().sessionStore.existingUserSessions()

        self.isLogin(login: arrUser.count > 0)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }

    //MARK:- User Defined Functions
    
    // Check if user is logged in or not
    func isLogin(login: Bool) {
        if login {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            self.window?.rootViewController = vc
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "navLogin") as? UINavigationController
            self.window?.rootViewController = vc
        }
    }
}

