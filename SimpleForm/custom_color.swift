//
//  custom_color.swift
//  SimpleForm
//
//  Created by admin on 29/07/24.
//

import SwiftUI

enum MyColor {
    case bgForm
    case anotherForm

    var color: Color {
        switch self {
        case .bgForm:
            return Color(hex: "BFBBB0")

        case .anotherForm:
            return Color(hex: "f2db94")
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgba: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&rgba)

        let red = Double((rgba >> 16) & 0xFF) / 255.0
        let green = Double((rgba >> 8) & 0xFF) / 255.0
        let blue = Double(rgba & 0xFF) / 255.0
        let alpha = Double((rgba >> 24) & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
