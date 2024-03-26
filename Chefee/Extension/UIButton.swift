//
//  UIButton.swift
//

import UIKit

extension UIButton
{
    func applyGradient(colors: [CGColor])
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
//    @IBInspectable
//    var checkLanguage: Bool {
//        
//        get {
//            return true
//        }
//        
//        set {
//            
//            if newValue && Localize.currentLanguage() == "ar" {
//                var edgeInsets = self.imageEdgeInsets
//                swap(&edgeInsets.left, &edgeInsets.right)
//                self.imageEdgeInsets = edgeInsets
//                
//                var titleInsets = self.titleEdgeInsets
//                swap(&titleInsets.left, &titleInsets.right)
//                self.titleEdgeInsets = titleInsets
//                self.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
//            }
//        }
//    }
    
    func addTextSpacing(_ letterSpacing: CGFloat){
            let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
            self.setAttributedTitle(attributedString, for: .normal)
    }
    
    @IBInspectable
        var letterSpacing: CGFloat {
            set {
                let attributedString: NSMutableAttributedString
                if let currentAttrString = attributedTitle(for: .normal) {
                    attributedString = NSMutableAttributedString(attributedString: currentAttrString)
                }
                else {
                    attributedString = NSMutableAttributedString(string: self.title(for: .normal) ?? "")
                    setTitle(.none, for: .normal)
                }

                attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: attributedString.length))
                setAttributedTitle(attributedString, for: .normal)
            }
            get {
                if let currentLetterSpace = attributedTitle(for: .normal)?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                    return currentLetterSpace
                }
                else {
                    return 0
                }
            }
        }
}

