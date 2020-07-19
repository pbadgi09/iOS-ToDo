//
//  ContentView.swift
//  CoreDataToDo
//
//  Created by Pranav Badgi on 05/03/20.
//  Copyright © 2020 Pranav Badgi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItem()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's next?")){
                    HStack{
                        TextField("New Item", text: self.$newToDoItem)
                        Button(action: {
                            if(self.newToDoItem == ""){
                                
                            }else{
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                                
                            }catch{
                                print(error)
                            }
                            self.newToDoItem = ""
                            }
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.toDoItems) {todoItem in
                        ToDoItemView(title: todoItem.title!,createdAt: "\(todoItem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                    
                    }
    
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        
        }
    
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
