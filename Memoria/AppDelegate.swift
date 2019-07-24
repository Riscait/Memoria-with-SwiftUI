//
//  AppDelegate.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/29.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import UIKit

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // FirebaseAppの共有インスタンスを構成
        FirebaseApp.configure()
        // 匿名認証
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                fatalError("\(error)認証エラー") // TODO: 認証エラーの例外
            }
            guard let auth = authResult else {
                fatalError("認証情報がありません") // TODO: 認証情報がなかった場合の例外
            }
            let user = auth.user
            let isAnonymous = user.isAnonymous
            let uid = user.uid
            
            
        }
        // Initialize the Google Mobile Ads SDK.
//        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
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

