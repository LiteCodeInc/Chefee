//
//  UIViewController.swift
//

import Foundation
import UIKit

extension UIViewController {
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    func showOkAlertWithOKCompletionHandler(_ msg: String, completion: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title:"", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func topMostViewController() -> UIViewController {

           if let navigation = self as? UINavigationController {
               return navigation.visibleViewController!.topMostViewController()
           }

           if self.presentedViewController == nil {
               return self
           }

           if let navigation = self.presentedViewController as? UINavigationController {
               return navigation.visibleViewController!.topMostViewController()
           }

           if let tab = self.presentedViewController as? UITabBarController {

               if let selectedTab = tab.selectedViewController {
                   return selectedTab.topMostViewController()
               }
               return tab.topMostViewController()
           }

           return self.presentedViewController!.topMostViewController()
    }
    
    func showToast(controller: UIViewController, message: String, seconds: Double, animate: Bool) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alert.view.backgroundColor = .white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: animate)
        }
    }

    //Hide Keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
