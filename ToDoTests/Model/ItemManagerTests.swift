//
//  ItemManagerTests.swift
//  ToDoTests
//
//  Created by Shan on 2018/7/19.
//  Copyright © 2018年 Shan. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!
    
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func test_ToDoCount_Initially_IsZero() {
        // abbreviation for system under test.
        
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    func test_DoneCount_Initially_IsZero() {
        
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_AddItem_IncreasesToDoCountToOne() {
        sut.add(ToDoItem(title: ""))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_ItemAt_ReturnsAddedItem() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        XCTAssertEqual(returnedItem.title, item.title)
    }
    
    func test_CheckItemAt_ChangesCounts() {
        sut.add(ToDoItem(title: ""))
        
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func test_CheckItemAt_RemovesItFromToDoItems() {
        let first = ToDoItem(title: "First")
        let second = ToDoItem(title: "Second")
        sut.add(first)
        sut.add(second)
        
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.item(at: 0).title, "Second")
    }
    
    func test_DoneItemAt_ReturnsCheckedItem() {
        let item = ToDoItem(title: "Foo")
        sut.add(item)
        
        sut.checkItem(at: 0)
        let returnedItem = sut.doneItem(at: 0)
        
        XCTAssertEqual(returnedItem.title, item.title)
        //XCTAssertEqual(returnedItem, item)
    }
    
    func test_EqualItems_AreEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        
        let second = ToDoItem(title: "", location: Location(name: "Bar"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (1.0, 0.0), secondName: "Foo", secondLongLat: (0.0, 0.0), line: 106)
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {

        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (0.0, 1.0), secondName: "Foo", secondLongLat: (0.0, 0.0), line: 116)
    }
    
    func assertLocationNotEqualWith(firstName: String, firstLongLat: (Double, Double)?, secondName: String, secondLongLat: (Double, Double)?, line: UInt) {
        
        var firstCoord: CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation, line: line)
    }
    
    func test_Locations_WhenOnlyOneHasCoordinate_AreNotEqual() {
        
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (0.0, 0.0), secondName: "Foo", secondLongLat: nil, line: 133)
    }
    
    func test_Locations_WhenNamesDiffer_AreNotEqual() {
        assertLocationNotEqualWith(firstName: "Foo", firstLongLat: nil, secondName: "Bar", secondLongLat: nil, line: 138)
    }
    
    func test_RemoveAll_ResultsInCountsBeZero() {
        sut.add(ToDoItem(title: "Foo"))
        sut.add(ToDoItem(title: "Bar"))
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_Add_WhenItemIsAlreadyAdded_DoseNotIncreasCount() {
        sut.add(ToDoItem(title: "Foo"))
        sut.add(ToDoItem(title: "Foo"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}













