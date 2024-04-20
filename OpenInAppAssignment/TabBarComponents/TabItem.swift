//
//  TabItem.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct TabItem: View {
    
    let image: String
    let text: String
    @Binding var tab: Int
    let color: Color
    
    var body: some View {
        VStack {
            Image(image)
                .frame(width: 32,height: 32)
                .foregroundStyle(.black)
            Text(text)
                .foregroundStyle(color)
                .minimumScaleFactor(0.01)
                .font(.custom("Figtree-Bold", size: 16))
        }
        .frame(width: 72,height: 61)
    }
}

//#Preview {
//    TabItem(image: "tab1", text: "Links")
//}
