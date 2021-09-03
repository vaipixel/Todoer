//
//  PathForCurve.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

extension Path {
    static func quadCurvedPathWithPoints(path: Path, points:[Double], step: CGPoint) -> Path {
        var path = path
        if(points.count < 2) {
            return path;
        }
        var p1 = CGPoint(x: 0, y: CGFloat(points[0]))
        path.move(to: p1)
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex]))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            p1 = p2;
        }
        return path
    }
    
    static func quadClosedCurvedPathWithPoints(points:[Double], step: CGPoint) -> Path {
        var path = Path()
        if (points.count < 2){
            return path
        }
        path.move(to: .zero)
        var p1 =  CGPoint(x: 0, y: CGFloat(points[0]))
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex]))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            p1 = p2;
        }
        path.addLine(to: CGPoint(x: p1.x, y: 0))
        path.closeSubpath()
        return path
    }
}

extension CGPoint {
    static func midPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
    }
    
    static func controlPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        var controlPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
        let diffX = abs(p2.x - controlPoint.x)
        let diffY = abs(p2.y - controlPoint.y)
        
        if(p1.y < p2.y) {
            controlPoint.x += diffX
            controlPoint.y -= diffY
        } else if(p1.y > p2.y) {
            controlPoint.x -= diffX
            controlPoint.y += diffY;
        }
//        controlPoint.x = controlPoint.x * 0.1
//        controlPoint.y = controlPoint.y * 1.9
        return controlPoint;
    }
    
    static func controlPointForPoints1(p1: CGPoint, p2: CGPoint, percent: CGFloat) -> CGPoint {
        var controlPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
        let diffX = abs(p2.x - controlPoint.x)
        let diffY = abs(p2.y - controlPoint.y)
        
//        let tmp = max(abs(p1.x - p2.x), abs(p1.y - p2.y))
        
        if(p1.y < p2.y) {
            controlPoint.x += diffX
            controlPoint.y -= diffY
        } else if(p1.y > p2.y) {
            controlPoint.x -= diffX
            controlPoint.y += diffY;
        }
//        controlPoint.x = controlPoint.x * 0.1
//        controlPoint.y = controlPoint.y * 1.9
        return controlPoint;
    }
}
