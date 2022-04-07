//
//  iTunesAppTests.swift
//  iTunesAppTests
//
//  Created by Çağrı Demir on 3.04.2022.
//

import XCTest
@testable import iTunesApp

class iTunesAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testData() throws {
        var filteredProducts = [Product]()
        var products = [Product]()
        var difference = 0
        
        let prodExp = expectation(description: "Product Expectation")
        let filteredProdExp = expectation(description: "Filtered Product Expectation")
        let diffExp = expectation(description: "Difference Expectation")
        
        func getProducts() {
            ProductsRepo.getProducts { response in
                guard let results = response.results else { return }
                products = results
                products.forEach { product in
                    if !(Globals.shared.removedItemIds?.contains(obj: String(product.trackId ?? 0)) ?? false) {
                        filteredProducts.append(product)
                    }
                }
                difference = products.count - filteredProducts.count
                prodExp.fulfill()
                filteredProdExp.fulfill()
                diffExp.fulfill()
            } failure: { error in
                print(error.rawValue)
            }
        }
        
        getProducts()
        
        waitForExpectations(timeout: 15) { error in
            print(error.debugDescription)
        }
        
        XCTAssertEqual(products.count, 50, "Product count must be 50.")
        XCTAssertEqual(difference, products.count - filteredProducts.count, "Difference must be equals to products.count - filteredProducts.count.")
        XCTAssertLessThanOrEqual(filteredProducts.count, products.count - difference, "Filtered products must be equals to products.count - difference.")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
