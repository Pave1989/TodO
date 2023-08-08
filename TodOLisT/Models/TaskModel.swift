//
//  TaskModel.swift
//  TodOLisT
//
//  Created by Павел Галкин on 08.08.2023.
//

import Foundation
import RealmSwift

class TaskModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}

