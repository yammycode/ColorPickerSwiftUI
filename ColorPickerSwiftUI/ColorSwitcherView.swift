//
//  ColorSwitcherView.swift
//  ColorPickerSwiftUI
//
//  Created by Anton Saltykov on 21.10.2022.
//

import SwiftUI

struct ColorSwitcherView: View {
    @Binding var colorValue: Double
    @State private var colorTFValue = ""
    @FocusState var focusedField: Bool

    let color: Color

    var body: some View {
        HStack {
            Text(lround(colorValue).formatted())
                .frame(width: 50, alignment: .trailing)
                .bold()
                .foregroundColor(.white)
            Slider(value: $colorValue, in: 0...255, step: 1)
                .tint(color)
                .padding(.horizontal, 10)
                .onChange(of: colorValue) { newValue in
                    colorTFValue = lround(newValue).formatted()
                }
            ColorTFView(colorValue: $colorValue,
                        colorTFValue: $colorTFValue,
                        focusedField: _focusedField)
        }
    }
}

struct ColorSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemIndigo).ignoresSafeArea()
            ColorSwitcherView(colorValue: .constant(100.0), color: .red)
        }
    }
}

