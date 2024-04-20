//
//  HorizontalScrollPickerCard.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct HorizontalScrollPickerCard: View {
    
    let image: String
    let mainText: String
    let subText: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Image(image)
                .frame(width: 32,height: 32)
            Text(mainText)
                .foregroundStyle(.black)
                .font(.custom("Figtree-Bold", size: 20))
            Text(subText)
                .foregroundStyle(.gray)
                .font(.custom("Figtree-Light", size: 20))
        }
        .frame(width: 120,height: 120)
        .padding()
        .background(.white,in: .rect(cornerRadius: 20))
      
    }
}

#Preview {
    ZStack{
        Color.black
        HorizontalScrollPickerCard(image: "pic1", mainText: "123", subText: "Today's clicks")
    }
}
