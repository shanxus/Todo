//
//  ToDoItem.swift
//  ToDo
//
//  Created by Shan on 2018/7/17.
//  Copyright © 2018年 Shan. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timeStamp: Double?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timeStamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timeStamp = timeStamp
        self.location = location
    }
}

