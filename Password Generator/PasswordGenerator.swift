//
//  PasswordGenerator.swift
//  Password Generator
//
//  Created by Kevin Chromik on 21.03.22.
//

import Combine
import Foundation

class PasswordGenerator: ObservableObject {

    @Published var passwordLength: Float = 16
    @Published var usesCapitalLetters = true
    @Published var usesNumbers = true
    @Published var usesExtraSymbols = true

    private let lowerCasedLetters = "abcdefghijklmnopqrstuvwxyz"
    private let upperCasedLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    private let numbers = "1234567890"
    private let specialCharacters = "!#$%&()*+,-./:;[]^_{}|~"

    var allLetters: String {
        var letters = lowerCasedLetters

        if usesCapitalLetters {
            letters += upperCasedLetters
        }
        if usesNumbers {
            letters += numbers
        }
        if usesExtraSymbols {
            letters += specialCharacters
        }

        return letters
    }

    var password: String {
        var pwd = ""

        for _ in 1...Int(passwordLength) {
            let element = allLetters.randomElement() ?? Character("")
            pwd.append(element)
        }

        return pwd
    }

    init() {}
}
