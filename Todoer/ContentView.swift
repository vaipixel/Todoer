//
//  ContentView.swift
//  todoer
//
//  Created by 冯旭超 on 2021/9/2.
//

import SwiftUI
import CoreData
import Drawer

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Category.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)],
        animation: .default)
    private var categories: FetchedResults<Category>
    
    @State private var picker = 0
    
    @State private var drawerHeight:[CGFloat] = [0]
    
    @State private var selectedCategory: Category?
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                Menu {
                    Button("Open in Preview", action: {})
                    Button("Save as PDF", action: {})
                } label: {
                    Label("PDF", systemImage: "doc.fill")
                }
            
                
                Text("Track your")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("task easy 👌")
                    .font(.subheadline)
                Picker(selection: $picker, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                    Text("Task").tag(0)
                    Text("Done").tag(1)
                }).pickerStyle(SegmentedPickerStyle())
                Group {
                    GeometryReader { geometry in
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(categories, id: \.id) { category in
                                    Text("Category \(category.name ?? "")")
                                        .background(Color.red)
                                        .onTapGesture {
                                            //                                            deleteItems(offsets: [0])
                                            selectedCategory = category
                                        }
                                    
                                }
                            }
                            
                        }
                        .background(GeometryReader{gp -> Color in
                            let rect = gp.frame(in: .named("OuterV"))
                            debugPrint("Origin: \(rect.height)")
                            return Color.green
                        })
                        .onAppear(perform: {
                            
                            var frame = geometry.frame(in: .global)
                            debugPrint("y \(frame.origin.y) \(frame.size.height)")
                            var screenHeight = UIScreen.main.bounds.height
                            self.drawerHeight = [screenHeight - frame.height - frame.origin.y - 10, UIScreen.main.bounds.height - 40]
                        })
                    }
                }.frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    //                        addTask(category: categories[0])
                    drawerHeight = [100, UIScreen.main.bounds.height - 40]
                    
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                Spacer()
            }
            .padding(30)
            
            Drawer(heights: $drawerHeight) {
                VStack (alignment: .center){
                    Spacer().frame(height: 4.0)
                    RoundedRectangle(cornerRadius: 3.0)
                        .foregroundColor(.gray)
                        .frame(width: 30.0, height: 6.0)
                    Color.blue
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(30)
                
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
    
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { categories[$0] }.forEach(viewContext.delete)
            
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
