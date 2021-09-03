//
//  TaskList.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct TaskList: View {
    @State private var tasks = ["A", "B", "C", "D", "E"]
    @State var selection: Set<UUID> = []
    @State private var editMode = EditMode.inactive
    var body: some View {

        ScrollView(.vertical) {
        HStack {
            ForEach(tasks, id: \.self) { key in
                TaskItem()
                    .onDrag({
                        NSItemProvider(object: URL.init(string: "nas://baidu.com") as! NSItemProviderWriting)
                    })
            }.onDelete(perform: {_ in
                print("onDelete")
            })
            .onMove(perform: move)
    
//            .onLongPressGesture {
//                withAnimation{
////                    self.editMode = EditMode.active
//                }
//
//            }
            
        }
        }
        
        .environment(\.editMode, $editMode)
        
    }
    func move(from source: IndexSet, to destination: Int) {
        // sort the indexes low to high
        let reversedSource = source.sorted()

        // then loop from the back to avoid reordering problems
        for index in reversedSource.reversed() {
            // for each item, remove it and insert it at the destination
            tasks.insert(tasks.remove(at: index), at: destination)
        }
        withAnimation{
            self.editMode = EditMode.inactive
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
