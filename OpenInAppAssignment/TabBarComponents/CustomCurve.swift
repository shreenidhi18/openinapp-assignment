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

        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        
        path.addLine(to: CGPoint(x: rect.midX - 40, y: rect.maxY))
        
        
        let controlOffset: CGFloat = 32.0
        let curveDepth: CGFloat = 30.0
        
        
        let control1 = CGPoint(x: rect.midX - controlOffset, y: rect.maxY)
        let control2 = CGPoint(x: rect.midX - controlOffset, y: rect.maxY - curveDepth)
        let to1 = CGPoint(x: rect.midX, y: rect.maxY - curveDepth)
        
        path.addCurve(to: to1, control1: control1, control2: control2)
        
        
        let control3 = CGPoint(x: rect.midX + controlOffset, y: rect.maxY - curveDepth)
        let control4 = CGPoint(x: rect.midX + controlOffset, y: rect.maxY)
        let to2 = CGPoint(x: rect.midX + 40, y: rect.maxY)
        
        path.addCurve(to: to2, control1: control3, control2: control4)
        
        
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
