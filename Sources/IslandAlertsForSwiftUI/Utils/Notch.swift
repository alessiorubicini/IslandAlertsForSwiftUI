//
//  Notch.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation

class Notch {
    
    private init() {}
    
    static var notchWidth: CGFloat {
        0
    }
    
    enum Width: CGFloat {
        case iPhone13OrAbove = 300
        case iPhone12OrOlder = 360
    }
    
}
