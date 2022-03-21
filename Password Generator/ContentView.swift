//
//  ContentView.swift
//  Password Generator
//
//  Created by Kevin Chromik on 17.03.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var generator = PasswordGenerator()

    var body: some View {
        VStack {
            HStack {
                Text(generator.password)
                    .font(.title2)
                Spacer()
                Button {
                    UIPasteboard.general.string = generator.password
                    print("store to clipboard")
                } label: {
                    Image(systemName: "doc.on.clipboard.fill")
                        .foregroundColor(.black)
                }
            }
            .padding()
            .frame(height: 120)


            List {
                CheckBoxView(checked: $generator.usesCapitalLetters, description: "Groß- und Kleinschreibung")
                CheckBoxView(checked: $generator.usesNumbers, description: "Nummern")
                CheckBoxView(checked: $generator.usesExtraSymbols, description: "Sonderzeichen")
            }

            Text("Passwortlänge \(Int(generator.passwordLength))")

            Slider(value: $generator.passwordLength,
                   in: 1...50,
                   step: 1.0)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
