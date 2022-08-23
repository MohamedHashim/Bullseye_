//
//  TextViews.swift
//  Bullseye
//
//  Created by Mohamed Ahmed on 23/08/2022.
//

import SwiftUI

struct InstuctionText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}


struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(String(text))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.body)//defualt font is body 18px
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstuctionText(text: "Instructions")
            BigNumberText(text: "99")
            SliderLabelText(text: "100")
        }
    }
}

