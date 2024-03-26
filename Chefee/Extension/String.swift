//
//  File.swift
//

import Foundation
import  UIKit

extension String {
    
    var isValidEmail: Bool {
       let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
       return testEmail.evaluate(with: self)
    }
    
    func returnColor() -> UIColor? {
        switch(self){
        case "Red":
            return UIColor.red
        case "Black":
            return UIColor.black
        case "Blue":
            return UIColor.blue
        case "Yellow":
            return UIColor.yellow
        case "Pink":
            return UIColor.systemPink
        case "Gray":
            return UIColor.gray
        case "White":
            return UIColor.white
        case "Cyan":
            return UIColor.cyan
        case "Green":
        return UIColor.green
        default:
            return nil
        }
    }
    
    func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty {
            return true
        }
        return (self.trimmingCharacters(in: .whitespaces) == "")
    }
    
    func maskCreditCardNumber(replacement:String = "xxxx-xxxx-xxxx-$4") -> String {
        let pattern = "(\\d{4})(\\d{4})(\\d{4})(\\d{4})"
//        let replacement = "xxxx-xxxx-xxxx-$4"

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let formattedNumber = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count), withTemplate: replacement)
            return formattedNumber
        } catch {
            return self
        }
        
    }
    
    func formatCardNumber(cardNumber: String) -> String {
        let formattedNumber = NSMutableString(string: cardNumber)
        
        // Calculate the number of groups needed
        let numberOfGroups = (cardNumber.count + 3) / 4
        
        // Insert a space every four characters
        for i in 1..<numberOfGroups {
            let insertionIndex = i * 5 - 1 // Calculate the index to insert the space
            formattedNumber.insert(" ", at: insertionIndex)
        }
        
        return String(formattedNumber)
    }
    
    func containsWhitespace() -> Bool {
        return rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }
}
