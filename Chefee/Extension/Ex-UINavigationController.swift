//
//  Ex-UINavigationController.swift
//  ERide
//
//  Created by Mapple.pk on 27/03/2023.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
    
//    func setupNavigation() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
////        appearance.backgroundColor = navBar
//        
//        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: .white]
//        appearance.titleTextAttributes = titleAttribute
//        
//        navigationBar.standardAppearance = appearance
//        navigationBar.scrollEdgeAppearance = appearance
//        navigationBar.tintColor = .white
//        navigationBar.isHidden = true
//        interactivePopGestureRecognizer?.isEnabled = false
//        
//        let yourBackImage = UIImage(named: "backArrow")
//        navigationController?.navigationBar.backIndicatorImage = yourBackImage
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//        navigationController?.navigationBar.backItem?.title = ""
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//    }
}
