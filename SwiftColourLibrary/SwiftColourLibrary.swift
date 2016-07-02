//
//  SwiftColourLibrary.swift
//
//  Created by Ryan Morris on 2016-06-17.
//  Copyright © 2016 Ryan Morris. All rights reserved.
//

import UIKit

extension UIColor {
    var rgb:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        return (r,g,b,a)
    }
    
    var hsb:(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var brightness:CGFloat = 0
        var alpha:CGFloat = 0
        return (hue,saturation,brightness,alpha)
    }
    
    var RGBColor:String {
    return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255))
    }
    var RGBaColor:String {
        return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255),Int(rgbComponents.alpha * 255) )
    }
    
    var GetHSB:String {
        return String(format: "H:%02xS:%02xB:%02xA:%02x", Int(hsb.hue), Int(hsb.hue), Int(hsb.hue), Int(hsb.hue))
    }
}

class SwiftColourLibrary : UIColor {

    func HexToUIColor(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    func UIColorToHex(hex:UIColor, alpha:Double=1.0)->UInt32 {
        return UInt32(hex.RGaBColor)
    }
    
    func rngUIColor()->UIColor{
        let  r = (arc4random_uniform(254) + 1)
        let g = (arc4random_uniform(254) + 1)
        let b = (arc4random_uniform(254) + 1)
        let z = r + g + b;
        let res = UIColor(z)
    }
    
    func rngHexColor()->UInt32{
        let rng = (arc4random_uniform(42949000) + 1)
        //let rng = (arc4random_uniform(23949000) + 1000)
        //let res = UInt32(rng)
        return rng;
    }
    
    func setViewHexColour(view: view, colour: UInt32){
        view.backgroundColor = HexToUIColor(colour)
    }
    
    func setViewUIColour(view: view, colour: UIColor){
        view.backgroundColor = colour
    }
        
    func UIColorGRBa(hex:UIColor)->String{
         return hex.HexRGBaColor
    }
    
    func UIColorHSB(hex:UIColor)->String{
        return hex.GetHSB
    }
}
