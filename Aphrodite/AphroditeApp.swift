//
//  AphroditeApp.swift
//  Aphrodite
//
//  Created by Arteezy on 8/25/21.
//

import SwiftUI
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.portrait //By default you want all your views to rotate freely
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //initializing fbsdk, because autoinitializing in newer version removed. Now, developers has to do it own.
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

@main
struct AphroditeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
//                .preferredColorScheme(.dark)
                
        }
    }
}








