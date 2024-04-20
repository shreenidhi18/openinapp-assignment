//
//  CustomTabBAr.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var tab: Int
    
    var body: some View {
        VStack(spacing: 0){
            
            HStack {
                CurvedTabBarShape()
                    .frame(width: 100,height: 100)
                    .foregroundStyle(.white)
            }
            
            HStack {
                Button {
                    tab = 0
                }
            label:{
                    TabItem(image: "tab1", text: "Links", tab: $tab, color: tab == 0 ? Color.black : .gray)
                }
                
                
                
                Button {
                    tab = 1
                }
                label:{
                    TabItem(image: "tab2", text: "Courses", tab: $tab, color: tab == 1 ? Color.black : .gray)
                }
                
                
                Circle()
                    .foregroundStyle(.blue)
                    .frame(width: 60,height: 60)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                    .offset(y: -21.5)
                    .shadow(radius: 10)
                
                
                Button {
                    tab = 2
                }
                label:{
                    TabItem(image: "tab3", text: "Campaign", tab: $tab, color: tab == 2 ? Color.black : .gray)
                }
                
                
                Button {
                    tab = 3
                }
                label:{
                    TabItem(image: "tab4", text: "Profile", tab: $tab, color: tab == 3 ? Color.black : .gray)
                }
            }
            .background(.white)
        }
    }
}

//#Preview {
//    ZStack{
//        Color.black
//        CustomTabBar()
//    }
//}
