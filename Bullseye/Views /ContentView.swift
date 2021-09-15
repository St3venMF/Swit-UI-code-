//
//  ContentView.swift
//  Bullseye
//
//  Created by PMStudent on 8/30/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisable: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("🎯🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: self.$sliderValue, in:1.0...100.0)
                    Text("100")
                        .bold()
                }
                .padding()
                Button(action: {
                    print("hello SwiftUI")
                    self.alertIsVisable = true
                }) {
                    Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                .background(Color("ButtonColor"))
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .alert(isPresented: $alertIsVisable, content: {
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title:  Text("hello there"), message: Text("The slider's value is \(roundedValue)."), dismissButton: .default(Text("Awesome")))
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
