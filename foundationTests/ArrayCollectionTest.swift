import XCTest

@testable import RevoFoundation

class ArrayCollectionTest: XCTestCase {

    override func setUp()   {}

    override func tearDown() {}

    func test_each() {
        let a       = [1, 2, 3]
        var b:[Int] = []
        
        a.each { b.append($0) }
        
        XCTAssertEqual(a, b)
    }

    
    func test_slice() {
        let collection = [1, 2, 3, 4]
        let slice      = collection.slice(3)
        
        XCTAssertEqual([4], slice)
        XCTAssertEqual([1, 2, 3, 4], collection)
        
        
        let slice2      = collection.slice(6)
        XCTAssertEqual([], slice2)
        
    }

    func test_slice_with_count() {
        let collection = [1, 2, 3, 4, 5]
        let slice      = collection.slice(2, howMany: 2)
        
        XCTAssertEqual([3, 4], slice)
        XCTAssertEqual([1, 2, 3, 4, 5], collection)
        
        let slice2      = collection.slice(2, howMany: 6)
        XCTAssertEqual([3, 4, 5], slice2)
    }
    
    func test_sort(){
        var collection = [6, 5, 7, 8 , 1]
            collection.sort()
        XCTAssertEqual([1, 5, 6, 7, 8], collection)
    }
    
    func test_sort_by(){
        struct testStruct {
            let name : String
        }
        
        let collection = [
            testStruct(name: "b"),
            testStruct(name: "c"),
            testStruct(name: "a"),
        ]
        
        let result = collection.sort(by: \.name)
        XCTAssertEqual("a", result.first!.name)
    }
    
    func test_firstWhere() {
        struct testStruct {
            let name : String
        }
        
        let collection = [
            testStruct(name: "b"),
            testStruct(name: "c"),
            testStruct(name: "a"),
        ]
        
        let value = collection.firstWhere(\.name, is: "c")
        let notFound = collection.firstWhere(\.name, is: "x")
        
        XCTAssertEqual("c", value!.name)
        XCTAssertNil(notFound)
    }
    
    func test_firstWhere_with_default() {
        struct testStruct {
            let name : String
        }
        
        let collection = [
            testStruct(name: "b"),
            testStruct(name: "c"),
            testStruct(name: "a"),
        ]
        
        let value = collection.firstWhere(\.name, is: "c")
        let notFound = collection.firstWhere(\.name, is: "x", defaultValue: testStruct(name: "z"))
        
        XCTAssertEqual("c", value!.name)
        XCTAssertEqual("z", notFound!.name)
    }
}