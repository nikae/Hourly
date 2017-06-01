//
//  Methods.swift
//  Hourly
//
//  Created by Nika on 6/1/17.
//  Copyright © 2017 Nika. All rights reserved.
//

import Foundation
import UIKit


func viewShape(view: UIView) {
    //but.backgroundColor = color
    view.clipsToBounds = true
    view.layer.cornerRadius = view.frame.height/2
    // but.layer.shadowRadius
}


func viewShedow(view: UIView) {
    view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
    view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    view.layer.shadowOpacity = 1.0
    view.layer.shadowRadius = 0.0
    view.layer.masksToBounds = false
    // but.layer.cornerRadius = 4.0
}
