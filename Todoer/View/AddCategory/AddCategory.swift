//
//  AddCategory.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct AddCategory: View {
    @State private var name: String = "";
    var body: some View {
        VStack {
            TextField( "Name", text: $name)
        }
    }
}

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory()
    }
}
