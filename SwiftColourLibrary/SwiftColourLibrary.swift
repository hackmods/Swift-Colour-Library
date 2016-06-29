//
//  VSwiftColourLibrary.swift
//
//  Created by Ryan Morris on 2016-06-17.
//  Copyright © 2016 Ryan Morris. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    func rngHexColor()->UInt32{
    let rng = (arc4random_uniform(23949000) + 1000)
    let res = UInt32( rng)
    return res;
    }
    
    func changeBG(){
        self.view.backgroundColor = UIColorFromHex(rngHexColor())
    }
}

