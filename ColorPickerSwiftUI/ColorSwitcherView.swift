//
//  ColorSwitcherView.swift
//  ColorPickerSwiftUI
//
//  Created by Anton Saltykov on 21.10.2022.
//

import SwiftUI

struct ColorSwitcherView: View {
    @Binding var colorValue: Double
    @State private var text: String = "10"


    //@State private var text = State(initialValue: $colorValue.wrappedValue)

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

            ColorTFView(colorValue: $colorValue)

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

