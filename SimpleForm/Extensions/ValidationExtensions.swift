//
//  ValidationFunction.swift
//  SimpleForm
//
//  Created by admin on 30/07/24.
//

import Foundation

private let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
private let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
private let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
private let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

private let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*)[A-Za-z]{8,}$"
private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)

extension String {
    func validateEmail() -> String? {
        if self.isEmpty {
            return "Email is required"
        }
        if emailPredicate.evaluate(with: self) {
            return nil
        }
        return "Email is not valid"
    }
    
    func validatePassword() -> String? {
        if self.count < 7 {
            return "Password must contains 8 characters"
        } else if passwordPredicate.evaluate(with: self) {
         return nil
        }
        return "Password is not valid"
    }
}

