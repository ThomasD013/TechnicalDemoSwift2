//
//  AppDelegate.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        AppEnvironment.shared.register()
        let rootViewController = UINavigationController(rootViewController: ViewControllerProvider.Consumer.list)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}
