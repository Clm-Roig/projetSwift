//
//  GraphicalCharter.swift
//  MonPkEtMoi
//
//  Created by Matthieu Dye on 22/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

let DEEP_BLUE = "#1C2145FF"
let LIGHT_BLUE = "#E6F7FFFF"
let ORANGE = "#FF7E0BFF"
let NONE = "#00000000"

class MyUIView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(hexString: LIGHT_BLUE)
    }
    
}

class MyUIButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let fontColor = UIColor(hexString: ORANGE)
        self.setTitleColor(fontColor, for: UIControlState.normal)
    }
}

class MyTextView: UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(hexString: NONE)
    }
}

class MyBlueLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(hexString: DEEP_BLUE)
    }
}


// Construct a UIColor from hexa code (format of hexString : #xxxxxxxxAA with AA for transparency, from 00 to ff)
extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        var hexString: String = hexString
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
            
                let scanner = Scanner(string: hexString)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            
        }
        
        return nil
    }
}
