//
//  RealmManager.swift
//  TodOLisT
//
//  Created by Павел Галкин on 06.08.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [TaskModel] = []
    
    init(){
        openRealm()
        getTask()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write({
                    let newTask = TaskModel(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Added new task to Realm: \(newTask)")
                })
            }catch{
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    func getTask() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(TaskModel.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
               let taskToUpdate = localRealm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                try localRealm.write({
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("Updated task with id \(id)! comleted status: \(completed)")
                })
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do{
                let taskToDelete = localRealm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }
                
                try localRealm.write({
                    localRealm.delete(taskToDelete)
                    getTask()
                    print("Deleted task with id \(id)")
                })
            }catch{
                print("Error deleting task \(id) to Realm: \(error)")
            }
        }
    }
}
