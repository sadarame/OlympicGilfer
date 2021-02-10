//
//  inputDialog.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/10.
//

import Foundation
import UIKit

public func alertD() {
    let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
    alert.addTextField() { textField in
        textField.placeholder = "名前を入力してください。"
    }
    
    let okAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
        let textFields = alert.textFields
        
        if textFields != nil {
            for textField:UITextField in textFields! {
                //各textにアクセス
                print(textField.text)
            }
        }
    }
    
    alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel) { _ in })
    alert.addAction(okAction)
    
    showAlert(alert: alert)
}

func showAlert(alert: UIAlertController) {
    if let controller = topMostViewController() {
        controller.present(alert, animated: true)
    }
}

private func keyWindow() -> UIWindow? {
    return UIApplication.shared.connectedScenes
    .filter {$0.activationState == .foregroundActive}
    .compactMap {$0 as? UIWindowScene}
    .first?.windows.filter {$0.isKeyWindow}.first
}

private func topMostViewController() -> UIViewController? {
    guard let rootController = keyWindow()?.rootViewController else {
        return nil
    }
    return topMostViewController(for: rootController)
}

private func topMostViewController(for controller: UIViewController) -> UIViewController {
    if let presentedController = controller.presentedViewController {
        return topMostViewController(for: presentedController)
    } else if let navigationController = controller as? UINavigationController {
        guard let topController = navigationController.topViewController else {
            return navigationController
        }
        return topMostViewController(for: topController)
    } else if let tabController = controller as? UITabBarController {
        guard let topController = tabController.selectedViewController else {
            return tabController
        }
        return topMostViewController(for: topController)
    }
    return controller
}
