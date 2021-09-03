//
//  CategoryList.swift
//  Todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    @FetchRequest(
        entity: Category.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)],
        animation: .default)
    private var categories: FetchedResults<Category>
    
//    @Binding var categories: [Category]
    var body: some View {
        ScrollView(.horizontal) {
            
            LazyHStack {
                ForEach(categories, id: \.id) { category in
                    NavigationLink(
                        destination: AddCategory()) {
                        CategoryItem()
                    }
                }
            }
        }
        .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}


struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
