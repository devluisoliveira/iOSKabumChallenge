//
//  UIColor.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let blueKabum = UIColor.rgb(red: 0, green: 77, blue: 142)
    static let backgroundKabum = UIColor.rgb(red: 234, green: 235, blue: 237)
}
