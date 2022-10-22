//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Anton Saltykov on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)

    var body: some View {
        ZStack {
            Color(.systemIndigo).ignoresSafeArea()
            VStack {
                Color(red: red/255, green: green/255, blue: blue/255)
                    .frame(height: 200)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 3)
                    )
                    .padding(.bottom, 16)
                ColorSwitcherView(colorValue: $red, color: .red)
                ColorSwitcherView(colorValue: $green, color: .green)
                ColorSwitcherView(colorValue: $blue, color: .blue)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
