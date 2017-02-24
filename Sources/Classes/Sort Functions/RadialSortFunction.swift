//
//  RadialSortFunction.swift
//  Spruce
//
//  Created by Jackson Taylor on 11/8/16.
//  Copyright (c) 2017 WillowTree, Inc.

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public enum SprucePosition {
    case topLeft
    case topMiddle
    case topRight
    case left
    case middle
    case right
    case bottomLeft
    case bottomMiddle
    case bottomRight
}

open class RadialSortFunction: BaseDistancedSortFunction {
    let position: SprucePosition
    
    public init(position: SprucePosition, interObjectDelay: TimeInterval) {
        self.position = position
        super.init(interObjectDelay: interObjectDelay)
    }
    
    open override func getDistancePoint(view: UIView, subviews: [UIView] = []) -> CGPoint {
        let distancePoint: CGPoint
        let bounds = view.bounds
        
        switch position {
        case .topLeft:
            distancePoint = CGPoint.zero
        case .topMiddle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: 0.0)
        case .topRight:
            distancePoint = CGPoint(x: bounds.size.width, y: 0.0)
        case .left:
            distancePoint = CGPoint(x: 0.0, y: (bounds.size.height / 2.0))
        case .middle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: (bounds.size.height / 2.0))
        case .right:
            distancePoint = CGPoint(x: bounds.size.width, y: (bounds.size.height / 2.0))
        case .bottomLeft:
            distancePoint = CGPoint(x: 0.0, y: bounds.size.height)
        case .bottomMiddle:
            distancePoint = CGPoint(x: (bounds.size.width / 2.0), y: bounds.size.height)
        case .bottomRight:
            distancePoint = CGPoint(x: bounds.size.width, y: bounds.size.height)
        }
        
        return translate(distancePoint: distancePoint, intoSubviews: subviews)
    }
}
