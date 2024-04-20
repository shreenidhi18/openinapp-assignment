//
//  CustomCurve.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct CustomCurve: View {
    var body: some View {
        CurvedTabBarShape()
            .frame(width: 100,height: 100)
            .foregroundStyle(.black)
    }
}


struct CurvedTabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start from the bottom left
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Line to start of curve
        path.addLine(to: CGPoint(x: rect.midX - 40, y: rect.maxY))
        
        // The control points are chosen based on experimentation and may need tweaking
        let controlOffset: CGFloat = 32.0
        let curveDepth: CGFloat = 30.0
        
        // Bottom left curve
        let control1 = CGPoint(x: rect.midX - controlOffset, y: rect.maxY)
        let control2 = CGPoint(x: rect.midX - controlOffset, y: rect.maxY - curveDepth)
        let to1 = CGPoint(x: rect.midX, y: rect.maxY - curveDepth)
        
        path.addCurve(to: to1, control1: control1, control2: control2)
        
        // Bottom right curve
        let control3 = CGPoint(x: rect.midX + controlOffset, y: rect.maxY - curveDepth)
        let control4 = CGPoint(x: rect.midX + controlOffset, y: rect.maxY)
        let to2 = CGPoint(x: rect.midX + 40, y: rect.maxY)
        
        path.addCurve(to: to2, control1: control3, control2: control4)
        
        // Complete the path by adding a line to the bottom right and then closing the path
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

//#Preview {
//    ZStack{
//        Color.black
//        CustomTabBar()
//    }
//}
