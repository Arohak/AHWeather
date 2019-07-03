//
//  UIHelper.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import PKHUD

struct UIHelper {
    
    static func configurateApplicationApperance() {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = GREEN
        navBarAppearance.tintColor = WHITE
        navBarAppearance.titleTextAttributes = [.foregroundColor: WHITE, .font : TITLE_BTN_FONT]
    }
    
    static func showProgressHUD() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        HUD.show(.progress)
    }
    
    static func hideProgressHUD() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        HUD.hide()
    }
    
    static func showHUD(message: String) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = true
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2.0);
    }
    
    static func showAlert(message: String) {
        let alertController = UIAlertController(title: "AHWeather", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let vc = appDelegate.window!.rootViewController
        vc!.present(alertController, animated: true, completion: nil)
    }
    
    static func shakeWithView(view: UIView) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let from_point = CGPoint(x: view.center.x - 5, y: view.center.y)
        let from_value = NSValue(cgPoint: from_point)
        
        let to_point = CGPoint(x: view.center.x + 5, y: view.center.y)
        let to_value = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        view.layer.add(shake, forKey: "position")
    }
}
