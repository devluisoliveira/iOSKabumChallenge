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
    
    static let blueKabum = UIColor.rgb(red: 63, green: 94, blue: 167)
    static let backgroundKabum = UIColor.rgb(red: 243, green: 244, blue: 255)
    static let backgroundCell = UIColor.rgb(red: 245, green: 248, blue: 254)
    static let titleProduct = UIColor.rgb(red: 87, green: 88, blue: 91)
    static let manufacturerProduct = UIColor.rgb(red: 167, green: 173, blue: 188)
    static let cashValue = UIColor.rgb(red: 254, green: 113, blue: 45)
    static let installmentAmount = UIColor.rgb(red: 164, green: 173, blue: 187)
}
