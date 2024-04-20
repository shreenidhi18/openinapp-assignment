//
//  TabButtons.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct TabButtons: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            
            Button {
                selectedTab = 0
            }label: {
                Text("Top Links")
                    .lineLimit(1)
                    .foregroundStyle(selectedTab == 0 ? .white : .gray)
                    .font(.custom("Figtree-bold", size: 18))
                    .padding(.vertical,10)
                    .padding(.horizontal,12)
                    .background(selectedTab == 0 ? .blue : .clear,in: .rect(cornerRadius: 27))
            }
            
            Button {
                selectedTab = 1
            }label: {
                Text("Recent Links")
                    .lineLimit(1) 
                    .foregroundStyle(selectedTab == 1 ? .white : .gray)
                    .font(.custom("Figtree-bold", size: 18))
                    .padding(.vertical,10)
                    .padding(.horizontal,12)
                    .background(selectedTab == 1 ? .blue : .clear ,in: .rect(cornerRadius: 27))
                    
            }
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .frame(width: 24,height: 24)
                .foregroundStyle(.gray)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                        
                }
            
        }
    }
}
//
//#Preview {
//    TabButtons()
//}
