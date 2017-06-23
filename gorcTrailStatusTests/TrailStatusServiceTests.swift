//
//  TrailStatusServiceTests.swift
//  gorcTrailStatus
//
//  Created by bserniak on 5/12/17.
//  Copyright © 2017 sern.labs. All rights reserved.
//
@testable import gorcTrailStatus
import XCTest

class TrailStatusServiceTests: XCTestCase {
    let testObject = TrailStatusService()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_processesTrailDataCorrectly() {
        let firstTrail: [String: AnyObject] = [
            "name": "firstTrail" as AnyObject,
            "area": "firstArea" as AnyObject,
            "status": 0 as AnyObject,
            "url": "/url/to/trail1" as AnyObject
        ]
        
        let secondTrail: [String: AnyObject] = [
            "name": "secondTrail" as AnyObject,
            "area": "secondArea" as AnyObject,
            "status": 1 as AnyObject,
            "url": "/url/to/trail2" as AnyObject
        ]
        
        let trails: [[String: AnyObject]] = [ firstTrail, secondTrail ]
        
        var jsonData = try! JSONSerialization.data(withJSONObject: trails, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        var results = testObject.processTrailJson(jsonData: jsonData)
    }
    
}
