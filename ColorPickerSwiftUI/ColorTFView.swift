//
//  ColorTFView.swift
//  ColorPickerSwiftUI
//
//  Created by Anton Saltykov on 22.10.2022.
//

import SwiftUI

struct ColorTFView: View {

    @Binding var colorValue: Double
    @Binding var colorTFValue: String
    @FocusState var focusedField: Bool
    @State private var alertPresented = false
    @State private var errorText = ""

    var body: some View {
        TextField("", text: $colorTFValue) { _ in
            editTFDone()
        }
        .onAppear {
            setTFEqualToColorValue()
        }
        .focused($focusedField)
        .keyboardType(.numbersAndPunctuation)
        .frame(width: 60)
        .textFieldStyle(.roundedBorder)
        .alert("Wrong value", isPresented: $alertPresented) {
            Button("Ok", action: {
                setTFEqualToColorValue()
            })
        } message: {
            Text(errorText)
        }
    }
}

extension ColorTFView {
    private func setTFEqualToColorValue() {
        colorTFValue = lround(colorValue).formatted()
    }

    private func editTFDone() {
        guard let colorNewValue = Double(colorTFValue) else {
            errorText = "Not numeric value"
            alertPresented = true
            return
        }
        if !(0...255).contains(colorNewValue) {
            errorText = "Not valid value (from 0 to 255)"
            alertPresented = true
            return
        }
        colorValue = colorNewValue
    }
}

struct ColorTFView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTFView(colorValue: .constant(10), colorTFValue: .constant("10"))
    }
}
