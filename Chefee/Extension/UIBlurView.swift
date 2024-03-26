//
//  UIBlurView.swift
//  ERide
//
//  Created by Mapple.pk on 30/03/2023.
//

import Foundation
import UIKit

extension UIVisualEffectView {
    @IBInspectable
    var opacity: Float {
        get {
            return layer.opacity
        }
        set {
            layer.opacity = newValue
        }
    }
}
