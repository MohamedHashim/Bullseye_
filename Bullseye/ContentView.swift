//
//  ContentView.swift
//  Bullseye
//
//  Created by Mohamed Ahmed on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible : Bool = false
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut the bullyseye as close as you can to")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .font(.footnote)
            Text("89")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .font(.body)
                    .fontWeight(.bold)
                Slider(value: .constant(50), in: 0.0...100.0)
                Text("100")
                .font(.body) //defualt font is body 18px
                .fontWeight(.bold)}
            Button(action:{
                self.alertIsVisible = true
                print("Hello, SwiftUI!")
            }) {
                Text("Hit me")
            }.alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Hello Title"), message: Text("Thank you!"), dismissButton: .default(Text("Bye")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
