//
//  AppDelegate.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 12/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var defaultContainer: DefaultContainer!
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        
        // Start AppCoordinator
        self.defaultContainer = DefaultContainer()
        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: currentWindow, container: defaultContainer.container)
        self.appCoordinator?.start()
        self.window = currentWindow
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    

}

