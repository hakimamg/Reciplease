//
//  CoreDataTests.swift
//  RecipleaseTests
//
//  Created by Amg on 21/10/2018.
//  Copyright © 2018 Amg-Industries. All rights reserved.
//

import XCTest
import CoreData
@testable import Reciplease

class CoreDataTests: XCTestCase {
    
    //MARK: - Vars
    var container: NSPersistentContainer!
    
    //MARK: - Tests Life Cycle
    override func setUp() {
        super.setUp()
        container = AppDelegate.persistentContainer
    }
    
    override func tearDown() {
        Ingredients.deleteAll()
        container = nil
        super.tearDown()
    }
    
    //MARK: - Helper Methods
    private func insertTodoItem(into managedObjectContext: NSManagedObjectContext) {
        let newTodoItem = Ingredients(context: managedObjectContext)
        newTodoItem.ingredient = "Tomatoes"
    }
    
    //MARK: - Unit Tests
    func testInsertManyToDoItemsInPersistentContainer() {
        for _ in 0 ..< 1000 {
            insertTodoItem(into: container.newBackgroundContext())
        }
        XCTAssertNoThrow(try container.newBackgroundContext().save())
    }
    
    func testDeleteAllToDoItemsInPersistentContainer() {
        Ingredients.deleteAll()
        XCTAssertEqual(Ingredients.all, [])
    }
}
