import SwiftUI
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = UINavigationController.init(rootViewController: RootViewController())
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        return true
    }
    
}
