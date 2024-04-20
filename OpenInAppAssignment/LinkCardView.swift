//
//  LinkCardView.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct LinkCardView: View {
    var jsonHelper: JSONHelper = JSONHelper()
    let title: String
    let date: String
    let clicks: Int
    let link: String
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Image("amazonLogo")
                    .frame(width: 48,height: 48)
                
                VStack(alignment: .leading,spacing: 10) {
                    Text(title)
                        .lineLimit(1)
                        .foregroundStyle(.black)
                        .font(.custom("Figtree-Light", size: 14))
                    
                    Text(jsonHelper.convertDateFormat(from: date))
                        .foregroundStyle(.gray)
                        .font(.custom("Figtree-Light", size: 12))
                }
                
                Spacer()
                
                VStack{
                    Text("\(clicks)")
                        .foregroundStyle(.black)
                        .font(.custom("Figtree-Bold", size: 14))
                    
                    Text("Clicks")
                        .foregroundStyle(.gray)
                        .font(.custom("Figtree-Light", size: 12))
                }
            }
            .padding()
            .background(.white)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 17,
                                              bottomLeadingRadius: 0,
                                              bottomTrailingRadius: 0,
                                              topTrailingRadius: 17))
            
            HStack {
                
                Text(link)
                    .lineLimit(1)
                    .foregroundStyle(.blue)
                    .font(.custom("Figtree-Light", size: 14))
                
                Spacer()
                
                Image(systemName: "doc.on.doc")
                    .foregroundStyle(.blue)
                    .frame(width: 24,height: 24)
            }
            .padding(10)
           
            .background(.blue.opacity(0.09))
            .overlay(
                            UnevenRoundedRectangle(topLeadingRadius: 0,
                                                   bottomLeadingRadius: 17,
                                                   bottomTrailingRadius: 17,
                                                   topTrailingRadius: 0)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                            .foregroundStyle(.blue)
                            

                        )
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0,
                                              bottomLeadingRadius: 17,
                                              bottomTrailingRadius: 17,
                                              topTrailingRadius: 0))
          
           
            
            
            
        }
        .padding()
    }
}




//#Preview {
//    var jsonHelper: JSONHelper = JSONHelper()
//    ZStack{
//        Color.white
//        LinkCardView(title: "test", date: "2023-03-09T08:00:05.000Z", clicks: "2000",link: jsonHelper.correctURLFormat(""))
//    }
//}
