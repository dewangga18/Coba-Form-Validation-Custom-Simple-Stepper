//
//  ContentView.swift
//  SimpleForm
//
//  Created by admin on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @FocusState private var focusedField: Int?

    @State var errorUsername: String?
    @State var errorPassword: String?
    @State var errorConfirmPassword: String?

    func validatePage1() {
        errorUsername = username.validateEmail()
        errorPassword = password.validatePassword()

        if confirmPassword != password || confirmPassword.isEmpty {
            errorConfirmPassword = "Confirm Password doesn't match with Password"
        } else {
            errorConfirmPassword = nil
        }

        focusedField = nil

        if errorUsername == nil && errorPassword == nil && errorConfirmPassword == nil {
            index = 2
        }
    }

    @State var index = 1

    var body: some View {
        VStack {
            CustomStepper(
                index: $index,
                firstComponent: {
                    FirstComponent(
                        username: $username,
                        password: $password,
                        confirmPassword: $confirmPassword,
                        errorUsername: $errorUsername,
                        errorPassword: $errorPassword,
                        errorConfirmPassword: $errorConfirmPassword,
                        tapAction: validatePage1
                    )
                },
                lastComponent: {
                    GeometryReader { geo in
                        VStack {
                            Spacer()

                            Color.white
                                .background(.white)
                                .padding(.all, 20)
                                .overlay {
                                    Text("Second Page")
                                }

                            Spacer()

                            HStack {
                                Button("Previous", action: {
                                    index = 1
                                })
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                                Spacer()

                                Button("Submit") {
                                    print("submit")
                                }
                                .padding()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            }.padding(.horizontal, 20)

                            Spacer()
                        }
                        .frame(height: geo.size.height)
                        .frame(width: geo.size.width)
                    }
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
