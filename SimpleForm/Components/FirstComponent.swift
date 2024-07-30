//
//  FirstComponent.swift
//  SimpleForm
//
//  Created by admin on 30/07/24.
//

import SwiftUI

struct FirstComponent: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @FocusState var focusedField: Int?
    @Binding var errorUsername: String?
    @Binding var errorPassword: String?
    @Binding var errorConfirmPassword: String?
    var tapAction: () -> Void

    var body: some View {
        Form {
            Section {
                CustomTextField(
                    placeHolder: "Email",
                    text: $username,
                    errorText: errorUsername
                )
                .keyboardType(UIKeyboardType.emailAddress)
                .focused($focusedField, equals: 0)
                .onSubmit {
                    focusedField = 0
                    let invalid = username.validateEmail()
                    if invalid != nil {
                        errorUsername = invalid
                    } else {
                        errorUsername = nil
                        focusedField = 1
                    }
                }
                .onChange(of: username) { _, value in
                    let invalid = value.validateEmail()
                    if invalid != nil {
                        errorUsername = invalid
                    } else {
                        errorUsername = nil
                    }
                }

                CustomTextField(
                    placeHolder: "Some Password",
                    text: $password,
                    errorText: errorPassword
                )
                .focused($focusedField, equals: 1)
                .onSubmit {
                    focusedField = 1
                    let invalid = password.validatePassword()
                    if invalid != nil {
                        errorPassword = invalid
                    } else {
                        errorPassword = nil
                    }
                }
                .onChange(of: password) { _, value in
                    let invalid = value.validatePassword()
                    if invalid != nil {
                        errorPassword = invalid
                    } else {
                        errorPassword = nil
                    }
                }

                CustomTextField(
                    placeHolder: "Confirm Password",
                    text: $confirmPassword,
                    errorText: errorConfirmPassword
                )
                .focused($focusedField, equals: 2)
                .onSubmit {
                    if confirmPassword != password {
                        errorConfirmPassword = "Confirm Password doesn't match with Password"
                    } else {
                        errorConfirmPassword = nil
                    }
                }
                .onChange(of: confirmPassword) { _, _ in
                    if confirmPassword != password {
                        errorConfirmPassword = "Confirm Password doesn't match with Password"
                    } else {
                        errorConfirmPassword = nil
                    }
                }

//                MARK: Format Number

//                CustomTextField(
//                    placeHolder: "Another State",
//                    text: $anotherState,
//                    errorText: "Example Error"
//                )
//                .onChange(of: anotherState) { _, newValue in
//                    let filtered = newValue.filter { "0123456789".contains($0) }
//                    if filtered != newValue {
//                        anotherState = filtered
//                    }
//                }
            }
            .padding(.vertical, 8)

            Button("Next", action: self.tapAction)
//            .disabled(
//                username.isEmpty || password.isEmpty || confirmPassword != password
//            )
        }
        .scrollContentBackground(.hidden)
        .background(Color(.form))
    }
}
