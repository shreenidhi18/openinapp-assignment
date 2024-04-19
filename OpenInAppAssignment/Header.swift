//
//  Header.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 31/03/24.
//

import SwiftUI

struct Header: View {
    
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                
                HStack{
                    Text("Dashboard")
                        .foregroundStyle(.white)
                        .font(.custom("Figtree-Bold", size: 30))
                        .bold()
                    
                    Spacer()
                    
                    Image("wrench")
                        .padding()
                        .background(Color("headerLightBlue"),in:.rect(cornerRadius: 10))
                }
                .offset(y: proxy.size.height / 18)

            }
            .padding()
            .padding(.bottom, proxy.size.height / 8)
            .background(Color("headerBlue"))

        }
        
    }
}

#Preview {
    ContentView()
}
