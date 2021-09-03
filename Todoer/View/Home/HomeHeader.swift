//
//  HomeHeader.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct HomeHeader: View {
    @State private var addCategory = false
    @State private var addTask = false
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Track your")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("task easy 👌")
                    .font(.subheadline)
            }
            Spacer()
            Menu {
                Button(action: {
                    self.addCategory = true
                }) {
                    Text("Add Category")
                }
                Button(action: {
                    self.addTask = true
                }) {
                    Text("Add Task")
                }
            } label: {
                Label("", systemImage: "ellipsis")
            }
            NavigationLink(destination: AddCategory(), isActive: $addCategory) {
                EmptyView()
            }
            NavigationLink(destination: AddTask(), isActive: $addTask) {
                EmptyView()
            }
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
