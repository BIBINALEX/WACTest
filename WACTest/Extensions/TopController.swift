//
//  TopController.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit

func topViewController() -> UIViewController? {
    
    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

    if var topController = keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    } else {
        return nil
    }
}

