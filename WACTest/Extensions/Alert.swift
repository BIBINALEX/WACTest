//
//  Alert.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit

func showSingleAlert(_ vc: UIViewController? = topViewController(), title: String, message: String) {
    DispatchQueue.main.async {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc?.present(alertController, animated: true, completion: nil)
    }
}
