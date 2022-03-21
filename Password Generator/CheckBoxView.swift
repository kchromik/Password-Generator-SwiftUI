//
//  CheckBoxView.swift
//  Password Generator
//
//  Created by Kevin Chromik on 20.03.22.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    let description: String

    var body: some View {

        HStack {
            Spacer()
            Text(description)
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked, description: "Groß- und Kleinschreibung")
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
