//
//  ContentView.swift
//  todoer
//
//  Created by Toner on 2021/9/3.
//  Copyright © 2021 Vaipixel. All rights reserved.
//

import SwiftUI
import CoreData
import Drawer
import FloatingButton

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var picker = 0
    
    @State private var drawerHeight:[CGFloat] = [0]
    
    @State private var selectedCategory: Category?
    
    @State private var isPresented = false
    
    @State var isOpen = false
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                VStack(alignment: .leading) {
                    HomeHeader()

                    HomePicker(picker: $picker)

                    CategoryList()
                        .background(GeometryReader { geometry -> Color in
                            let frame = geometry.frame(in: .global)
                            self.drawerHeight = [UIScreen.main.bounds.height - frame.origin.y - frame.size.height - 10, UIScreen.main.bounds.height - 40]
                            debugPrint("origin y \(frame.origin.y) height: \(frame.size.height)")
                            return Color.clear
                        })
                    Spacer()
                    TaskList()
                        .background(Color.red)
                        .cornerRadius(30)
                }
                .padding(30)
                
//                Drawer(heights: $drawerHeight) {
//
//                }
//                .edgesIgnoringSafeArea(.vertical)
//
//
                
            }
            .navigationBarHidden(true)

        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        
        
    }
    @State var isNavigationBarHidden: Bool = true
    private func addCategory() {
        withAnimation {
            let newCategory = Category(context: viewContext)
            newCategory.name = "Hello"
            
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func addTask( category:Category) {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.title = "cei"
            newTask.category = category
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { categories[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11 Pro").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
