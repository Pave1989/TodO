//
//  TaskRow.swift
//  TodOLisT
//
//  Created by Павел Галкин on 04.08.2023.
//

import SwiftUI

struct TaskRow: View {
    
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "chevron.down.square" : "square")
            Text(task)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do some", completed: true)
    }
}
