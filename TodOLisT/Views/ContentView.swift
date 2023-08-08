//
//  ContentView.swift
//  TodOLisT
//
//  Created by Павел Галкин on 06.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var  showAddTaskView = false
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(LinearGradient(colors: [.cyan, .green], startPoint: .top, endPoint: .center))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
