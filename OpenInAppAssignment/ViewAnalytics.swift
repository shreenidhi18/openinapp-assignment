//
//  ViewAnalytics.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct ViewAnalytics: View {
    var body: some View {
        Button {
            
        }label: {
            HStack{
                Spacer()
                Image("Arrows")
                    .frame(width: 32,height: 32)
                
                Text("View Analytics")
                    .foregroundStyle(.black)
                    .font(.custom("Figtree-Bold", size: 20))
                Spacer()
            }
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black.opacity(0.2))
                    
            }
        }
    }
}

#Preview {
    ViewAnalytics()
}
