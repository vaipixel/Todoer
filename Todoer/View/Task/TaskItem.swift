//
//  TaskItem.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct TaskItem: View {
    var body: some View {
        HStack {
            VStack {
                Text("TaskName")
                Text("taskNote")
            }
        }
    }
}

struct TaskItem_Previews: PreviewProvider {
    static var previews: some View {
        TaskItem()
    }
}
