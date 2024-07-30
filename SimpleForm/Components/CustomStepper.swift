//
//  CustomStepper.swift
//  SimpleForm
//
//  Created by admin on 30/07/24.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var index: Int
    let firstComponent: AnyView
    let lastComponent: AnyView

    init(index: Binding<Int>,
         @ViewBuilder firstComponent: () -> some View,
         @ViewBuilder lastComponent: () -> some View)
    {
        self._index = index
        self.firstComponent = AnyView(firstComponent())
        self.lastComponent = AnyView(lastComponent())
    }

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(height: 30)
                    .foregroundColor( .blue.opacity(0.8))
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 15)
                    .foregroundColor(
                        index > 1 ? .blue.opacity(0.8) : .gray.opacity(0.5)
                    )
                    .ignoresSafeArea()
                Circle()
                    .frame(height: 30)
                    .foregroundColor(
                        index > 1 ? .blue.opacity(0.8) : .gray.opacity(0.5)
                    )
                    .ignoresSafeArea()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            if index > 1 {
                lastComponent
            } else {
                firstComponent
            }
        }
        .background(Color.form)
    }
}

