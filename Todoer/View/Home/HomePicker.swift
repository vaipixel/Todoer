//
//  HomePicker.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct HomePicker: View {
    @Binding var picker: Int
    var body: some View {
        Picker(selection: $picker, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
            Text("Task").tag(0)
            Text("Done").tag(1)
        }).pickerStyle(SegmentedPickerStyle())
    }
}

struct HomePicker_Previews: PreviewProvider {
    static var previews: some View {
        HomePicker(picker: .constant(0))
    }
}
