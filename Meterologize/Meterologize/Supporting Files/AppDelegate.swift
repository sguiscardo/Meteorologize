//
//  AppDelegate.swift
//  Meterologize
//
//  Created by Karl Pfister on 8/19/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        CityController.sharedInstance.createCity(name: "Salt Lake City", temp: 69.0, high: 81, low: 43, status: "Partly Cloudy")
        CityController.sharedInstance.createCity(name: "New Mexico", temp: 103.1, high: 108, low: 95, status: "Sunny. Slight NW wind")
        CityController.sharedInstance.createCity(name: "Las Vegas", temp: 111.8, high: 114, low: 103, status: "Sunny. Weather Warning: Too much sun")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

