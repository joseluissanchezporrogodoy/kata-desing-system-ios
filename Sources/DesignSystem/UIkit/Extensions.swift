//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import UIKit


@objc public extension UIViewController {
    
    /**
     Show a meesage like a Toast. Can send an image optionally
     @param message  Text to show
     @param image  Optional. Url of image to showw
     */
    @nonobjc func showAlert(title: String, style: AlertStyle, alertInfo: ODSAlertInformation) {
        DispatchQueue.main.async {
            guard let topController =  UIViewController.currentTopController() else { return }
            UIDSAlertUK.show(title: title, style: style, alertInfo: alertInfo, controller: topController)
        }
    }
    
    @nonobjc func showRecicledAlertshow(title: String, style: AlertStyle, alertInfo: ODSAlertInformation) {
        DispatchQueue.main.async {
            guard let topController =  UIViewController.currentTopController() else { return }
            UIDSAlert.show(title: title, style: style, alertInfo: alertInfo, controller: topController)
        }
    }
    
    static func currentTopController() -> UIViewController? {
        let topController = UIViewController.topMostController()
        return topController
    }
    
    static func topMostController() -> UIViewController? {
        var topController = UIApplication.shared.currentWindowRootVC

        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
    
}

extension UIApplication {
    var currentWindowRootVC: UIViewController? {
        return self.currentWindow?.rootViewController
    }
    
    var currentWindow: UIWindow? {
        return self.connectedScenes.compactMap({$0 as? UIWindowScene})
                                   .first?
                                   .windows.first { $0.isKeyWindow }
    }
}
