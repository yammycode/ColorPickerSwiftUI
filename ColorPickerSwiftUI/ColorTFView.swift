//
//  ColorTFView.swift
//  ColorPickerSwiftUI
//
//  Created by Anton Saltykov on 22.10.2022.
//

import SwiftUI

struct ColorTFView: View {

    @Binding var colorValue: Double
    @State var colorTFValue: String?

    var body: some View {
        let bindingValue = Binding<String>(
            get: { colorTFValue ?? lround(colorValue).formatted() },
            set: { self.colorTFValue = $0 }
        )

        TextField("", text: bindingValue) {
            guard let colorNewValue = Double(colorTFValue ?? "") else { return }
            colorTFValue = nil
            colorValue = colorNewValue
        }
        .keyboardType(.numbersAndPunctuation)
        .frame(width: 60)
        .textFieldStyle(.roundedBorder)
    }
}

struct ColorTFView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTFView(colorValue: .constant(10))
    }
}
