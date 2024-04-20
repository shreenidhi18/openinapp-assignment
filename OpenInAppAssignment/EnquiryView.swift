//
//  EnquiryView.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

enum Enquiry {
    case Talk
    case Questions
}

struct EnquiryView: View {
    
    let type: Enquiry
    
    var body: some View {
    
    
        Button {
            
        }
    label:{
            HStack(spacing: 20) {
                Image(type == .Talk ? "whatsLogo" : "questionLogo")
                    .frame(width: 24,height: 24)
                
                Text(type == .Talk ? "Talk with us" : "Frequently Asked Questions")
                    .foregroundStyle(.black)
                    .font(.custom("Figtree-Bold", size: 16))
                
                Spacer()
            }
            .padding()
            .background(type == .Talk ? .green.opacity(0.2) : .blue.opacity(0.2),in: .rect(cornerRadius: 17))
            .overlay {
                RoundedRectangle(cornerRadius: 17)
                    .stroke(lineWidth: 2)
                    .foregroundStyle((type == .Talk ? .green.opacity(0.2) : .blue.opacity(0.2)))
                    
            }
        }
    }
}

#Preview {
    EnquiryView(type: .Talk)
}
