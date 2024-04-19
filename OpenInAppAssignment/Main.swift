//
//  Main.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 31/03/24.
//

import SwiftUI

struct Main: View {
    @Binding var greeting: String
    var body: some View {
        VStack {
            
                    
                    HStack {
                        
                        if !greeting.isEmpty{
                            Text(greeting)
                                .foregroundStyle(.gray)
                                .font(.custom("Figtree-Light", size: 20))
                        } else {
                            Text(" ")
                                .foregroundStyle(.gray)
                                .font(.custom("Figtree-Light", size: 20))
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
            
            
            
                    HStack {
                        
                        Text("Ajay Manva 👋")
                            .foregroundStyle(.black)
                            .font(.custom("Figtree-Bold", size: 30))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top,1)
                
            
            
            
            
            
            
            
            
            
                    
                    
                }
        
        .background(Color("mainColor"),in: .rect(cornerRadius: 20))
    }
}

#Preview {
    ContentView()
}
