//
//  GetDataAsynchronouslyTests.swift
//  UsersChallengeTests
//
//  Created by Adam Khan on 12/02/2023.
//

import XCTest
@testable import UsersChallenge

final class GetDataAsynchronouslyTests: XCTestCase {

    let manager: GenericDataManager = GenericDataManager(genericDownloader: FakeNetworkManager())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetData() async {
        guard let url = Bundle.main.url(forResource: "TestJson", withExtension: "json") else {
            print("\n-------> bundle path error: File not found")
            XCTAssertEqual(2, 33)
            return
            }
        do {
            let result = try await self.manager.getDataAsynchronously(for: url, type: UserResponse.self)
            let users = result.data
            XCTAssertEqual(users.count, 6)
        }
        catch {
            XCTAssertEqual(2, 33)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
