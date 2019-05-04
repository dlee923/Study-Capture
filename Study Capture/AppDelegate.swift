//
//  AppDelegate.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/3/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let mainViewController = MainViewController()
        let navController = UINavigationController(rootViewController: mainViewController)
        
        window?.rootViewController = navController
        
        return true
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

/*
 Project: App
 Study Capture App
 
 Background
 Our clinical services team has come to us for help in developing an iPhone app for study capture. This app will allow a user to enter their subject id into a text box and capture a selfie image in portrait orientation with the front camera. The image will then need to have the subject’s id “burned in” to the lower right hand corner after having a core image filter applied, and then saved  to the camera roll.
 
 Goals
 The overall goal of this application is to allow the user to capture a selfie image to be later submitted for analysis.
 
 Constraints
 The subject id is alphanumeric.
 The subject id written into the image needs to be in a white font on a black rectangular background.
 The core image filter to be applied is a CIUnsharpMask with an input radius of 11 and an input intensity of 0.5.
 The workflow of the app is: Enter subject id – capture image – review image – process image – display result image.
 Display result image view needs to have a save button which will cause the displayed image to be saved to the camera roll.
 
 For extra credit, display a custom spinner that you have written in the center of the screen while the image is being processed.
 
 */
