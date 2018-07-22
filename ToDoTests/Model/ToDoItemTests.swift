//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Shan on 2018/7/17.
//  Copyright © 2018年 Shan. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "should set title")
    }
    
    func test_Init_TakesTitleAndDesciption() {
        let item = ToDoItem(title: " ", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
    }
    
    func test_Init_SetsTimestamp() {
        let item = ToDoItem(title: "", timeStamp: 0.0)
        
        XCTAssertEqual(item.timeStamp, 0.0, "should set timestamp")
    }
    
    func test_Init_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        
        XCTAssertEqual(item.location?.name, location.name, "should set location")
    }
    
    func test_Items_WhenOneLocationIsNil_AreNotEqual() {
        var first = ToDoItem(title: "", location: Location(name: "Foo"))
        var second = ToDoItem(title: "", location: nil)
        
        first = ToDoItem(title: "", location: nil)
        second = ToDoItem(title: "", location: Location(name: "Foo"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTimestampsDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", timeStamp: 1.0)
        let second = ToDoItem(title: "Foo", timeStamp: 0.0)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenDescriptionsDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTitleDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Bar")
        
        XCTAssertNotEqual(first, second)
    }
}







