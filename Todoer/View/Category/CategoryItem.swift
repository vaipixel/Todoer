//
//  CategoryItem.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("💼")
                //                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width: 15, height:15,alignment: .center)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
            
            HStack {
                Spacer()
            }
            Text("Work")
                .fontWeight(.bold)
            Text("+12 task")
            
        }
        //        .frame(width: 120, height: 120)
        .padding(10)
     
        .frame(width: 100, height: 100)
    
//        .cornerRadius(20)
        .background(CategoryBackground())
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem()
    }
}

struct CategoryBackground: View {
    var cornerRadius = CGFloat(20)
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.frame(in: .local).size
            let width = size.width
            let height = size.height
            Path { path in
                path.move(to: CGPoint(x: cornerRadius, y: 0))
                path.addLine(to: CGPoint(x: width / 2, y: 0))
                
                let x1 = width / 2
                let x2 = width / 2 + cornerRadius / 2
                let p1 = CGPoint(x:x1, y:0)
                let p2 = CGPoint(x: x2, y: cornerRadius)
                path.addQuadCurve(to: p2, control:CGPoint.controlPointForPoints(p1: p1, p2: p2))
                
                let p3 = CGPoint(x: width - cornerRadius * 2, y: height / 3 - cornerRadius / 2)
                path.addQuadCurve(to: p3, control: CGPoint.controlPointForPoints(p1: p3, p2: p2))
                let p4 = CGPoint(x: width, y: height / 4 + cornerRadius )
                path.addQuadCurve(to: p4, control: CGPoint.controlPointForPoints(p1: p3, p2: p4))
                //                path.addLine(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: width, y: height - cornerRadius))
                path.addArc(center: CGPoint(x: width - cornerRadius, y: height - cornerRadius), radius: cornerRadius, startAngle: Angle.init(degrees: 0), endAngle: Angle.init(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: cornerRadius, y: height))
                path.addArc(center: CGPoint(x:  cornerRadius, y: height - cornerRadius), radius: cornerRadius, startAngle: Angle.init(degrees: 90), endAngle: Angle.init(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: cornerRadius))
                path.addArc(center: CGPoint(x: cornerRadius, y:  cornerRadius), radius: cornerRadius, startAngle: Angle.init(degrees: 180), endAngle: Angle.init(degrees: 270), clockwise: false)
                path.addLine(to: CGPoint(x: cornerRadius, y: 0))
            }
            .fill(Color.blue)
        }
    }
    func HoleShapeMask(in rect: CGRect) -> Path {
        var shape = Rectangle().path(in: rect)
        
        let path = Path { path in
            path.move(to: CGPoint(x: 150, y: 0))
            path.addLine(to: CGPoint(x: 175, y: 25))
            path.addLine(to: CGPoint(x: 300, y: 50))
            path.addLine(to: CGPoint(x: 300, y: 0))
        }
        
        
        shape.addPath(path)
        return shape
    }
}

struct CategoryBackground_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBackground()
            .previewLayout(.sizeThatFits)
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
