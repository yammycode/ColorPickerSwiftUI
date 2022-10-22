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

    @FocusState private var focusedField: Bool

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
                    .padding(.bottom)
                ColorSwitcherView(colorValue: $red, focusedField: _focusedField, color: .red)
                ColorSwitcherView(colorValue: $green, focusedField: _focusedField, color: .green)
                ColorSwitcherView(colorValue: $blue, focusedField: _focusedField, color: .blue)
            }
            .focused($focusedField)
            .onTapGesture {
                focusedField = false
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
