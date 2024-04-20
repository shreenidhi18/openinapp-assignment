//
//  TabView.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct TabbedView: View {
    
    @Binding var selectedTab: Int
    let recentLinkstitles: [String] 
    let topLinkstitles: [String] 
    let recentLinksUrls: [String] 
    let topLinksUrls: [String] 
    let recentLinksArray: [Link] 
    let topLinksArray: [Link] 
    
    var body: some View {
        VStack {
            
            switch selectedTab {
            case 0:
                if !topLinkstitles.isEmpty{
                    VStack {
                        ForEach(topLinkstitles.indices,id: \.self) { index in
                            VStack(spacing: 0) {
                                LinkCardView(title: topLinkstitles[index], date: topLinksArray[index].createdAt, clicks: topLinksArray[index].totalClicks, link: topLinksUrls[index])
                            }
                        }
                    }
                }else {
                    ProgressView()
                        .padding()
                }
            case 1:
                if !recentLinkstitles.isEmpty{
                    VStack {
                        ForEach(recentLinkstitles.indices,id: \.self) { index in
                            VStack(spacing: 0) {
                                LinkCardView(title: recentLinkstitles[index], date: recentLinksArray[index].createdAt, clicks: recentLinksArray[index].totalClicks, link: recentLinksUrls[index])
                            }
                        }
                    }
                } else {
                    ProgressView()
                        .padding()
                }
            default:
                EmptyView()
            }
            
        }
        
    }
}

//#Preview {
//    TabView()
//}
