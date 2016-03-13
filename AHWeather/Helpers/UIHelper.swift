//
//  UIHelper.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import SwiftLoader
import PKHUD

class UIHelper {
    
    class func configurateApplicationApperance() {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = GREEN
        navBarAppearance.tintColor = WHITE
        navBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: WHITE, NSFontAttributeName : TITLE_BTN_FONT]
    }
    
    class func showProgressHUD() {
        var config = SwiftLoader.Config()
        config.size = 100
        config.spinnerColor = WHITE
        config.backgroundColor = GRAY_164
        config.foregroundAlpha = 0.3
        SwiftLoader.setConfig(config)
        SwiftLoader.show(animated: true)
    }
    
    class func hideProgressHUD() {
        SwiftLoader.hide()
    }
    
    class func showHUD(message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0);
    }
    
    class func showAlert(message: String) {
        let alertController = UIAlertController(title: "AHWeather", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        let vc = appDelegate.window!.rootViewController
        vc!.presentViewController(alertController, animated: true, completion: nil)
    }
    
    class func shakeWithView(view: UIView) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let from_point = CGPointMake(view.center.x - 5, view.center.y)
        let from_value = NSValue(CGPoint: from_point)
        
        let to_point = CGPointMake(view.center.x + 5, view.center.y)
        let to_value = NSValue(CGPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        view.layer.addAnimation(shake, forKey: "position")
    }
}