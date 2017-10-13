//
//  Extentions.swift
//  Tinder
//
//  Created by Raina Wang on 10/12/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import Foundation

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
