//
//  ContentView.swift
//  Bullseye
//
//  Created by Mohamed Ahmed on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut the bullyseye as close as you can to")
                .padding()
            Text("89")
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 0.0...100.0)
                Text("100")}
            Button(action:{}) {
                Text("Hit me")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
