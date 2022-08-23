//
//  ContentView.swift
//  Bullseye
//
//  Created by Mohamed Ahmed on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var knockKnonkIsVisible = false
    @State private var sliderValue = 10.0
    @State private var game = Game()
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                // pass $ as it's biding variable
                InstructionViews(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                
                // new style of Alert
                //                Button("Knock Knock!") {
                //                    knockKnonkIsVisible = true
                //                }.alert("Who's there?", isPresented: $knockKnonkIsVisible){
                //                    Button("Little lady who?"){}
                //                } message:{Text("Little old lady")}
            }
        }
    }
}

struct InstructionViews: View {
    // to call a state variable I have to use binding variable and pass it in $ sign
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstuctionText(text: "🎯🎯🎯\nPut the bullyseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing,30.0)
            BigNumberText(text:String(game.target))
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 0.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct HitMeButton: View {
    
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        //deprecated style
        Button(action: {
            alertIsVisible = true
            print("Hello, SwiftUI!")
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }.padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    
                })
            .foregroundColor(Color.white)
            .cornerRadius(21.0)
            .overlay(RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder( Color.white ,lineWidth: 2.0, antialiased: true))  // for white border
            .alert(isPresented: $alertIsVisible,
                   content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("Hello Title"), message: Text("The slider value is \(roundedValue)\n" + "Score is \(game.points(sliderValue:roundedValue)) "), dismissButton: .default(Text("Bye")))
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView().previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
        
    }
}
