//
//  ContentView.swift
//  Password Generator
//
//  Created by Kevin Chromik on 17.03.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var generator = PasswordGenerator()

    @State private var speed = 50.0
    @State private var isEditing = false

    var body: some View {
        VStack {
            HStack {
                Text(generator.password)
                Spacer()
                Button {
                    print("store to clipboard")
                } label: {
                    Image(systemName: "doc.on.clipboard.fill")
                        .foregroundColor(.black)
                }
            }
            .padding()


            List {
                CheckBoxView(checked: $generator.usesCapitalLetters, description: "Groß- und Kleinschreibung")
                CheckBoxView(checked: $generator.usesNumbers, description: "Nummern")
                CheckBoxView(checked: $generator.usesExtraSymbols, description: "Sonderzeichen")
            }

            Slider(value: $generator.passwordLength,
                   in: 1...50,
                   onEditingChanged: { editing in
                isEditing = editing
            })

            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
        }



    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
