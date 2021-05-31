//
//  WTText.swift
//  WodTime
//
//  Created by Rey Felipe on 5/29/21.
//

import SwiftUI

struct WTText: View {
    let text: String
    let size: CGFloat
    let kerning: CGFloat
    
    init(_ text: String,
         size: CGFloat = 20, kerning: CGFloat = 1.4) {
        self.text = text
        self.size = size
        self.kerning = kerning
    }
    
    var body: some View {
        Text(text)
            .font(.custom("Impact", size: size))
            .kerning(kerning)
    }
}

struct WTText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WTText("CrossFit", size: 40, kerning: 10)
            WTText("CrossFit", size: 40)
                .preferredColorScheme(.dark)
        }
    }
}
