//
//  AppDelegate.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.frame = UIScreen.mainScreen().bounds
        self.window?.rootViewController = FeedViewController()
    
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

