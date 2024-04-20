//
//  HorizontalScrollPicker.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct CardModel: Identifiable {
    var id: UUID = UUID()
    var image: String
    var text: String
    var subtext: String
    
    init(image: String, text: String, subtext: String) {
        self.id = UUID()
        self.image = image
        self.text = text
        self.subtext = subtext
    }
}



struct HorizontalScrollPicker: View {
    
    let cards :[CardModel] = [.init(image: "pic1", text: "123", subtext: "Today's clicks"),
                              .init(image: "pic2", text: "Ahmedabad", subtext: "Top Location"),
                              .init(image: "pic3", text: "Instagram", subtext: "Top source")]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
               
                ForEach(cards) { card in
                    HorizontalScrollPickerCard(image: card.image, mainText: card.text, subText: card.subtext)
                }
                VStack(alignment: .leading,spacing: 10) {
                    Image(systemName: "clock")
                        .foregroundStyle(.yellow)
                        .padding(7)
                        .background(.yellow.opacity(0.2),in: .circle)
                        .frame(width: 32,height: 32)
                    Text("11:00 - 12:00")
                        .foregroundStyle(.black)
                        .font(.custom("Figtree-Bold", size: 20))
                    Text("Best time")
                        .foregroundStyle(.gray)
                        .font(.custom("Figtree-Light", size: 20))
                }
                .frame(width: 120,height: 120)
                .padding()
                .background(.white,in: .rect(cornerRadius: 20))
            }
        }
        .scrollIndicators(.hidden)
        .padding(.leading)
        
    }
}

#Preview {
    ZStack{
        Color.gray
        HorizontalScrollPicker()
    }
}
