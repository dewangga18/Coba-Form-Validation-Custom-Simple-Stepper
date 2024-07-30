//
//  CustomTextField.swift
//  SimpleForm
//
//  Created by admin on 29/07/24.
//

import Combine
import SwiftUI

struct CustomTextField: View {
    var placeHolder: String?
    @Binding var text: String
    var errorText: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if errorText != nil && !(errorText?.isEmpty ?? false) {
                Text(errorText ?? "")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            TextField(placeHolder ?? "", text: $text)
        }
    }
}
