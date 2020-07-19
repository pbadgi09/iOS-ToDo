//
//  ToDoItemView.swift
//  CoreDataToDo
//
//  Created by Pranav Badgi on 05/03/20.
//  Copyright © 2020 Pranav Badgi. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }

}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My Great todo", createdAt: "Today")
    }
}
