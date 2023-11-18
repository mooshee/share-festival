//
//  Util.swift
//  FestivalTests
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation
import XCTest

enum TestError: Error {
    case fileNotFound(fileName: String)
}

extension XCTestCase {
    func getData(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        print("bundleURL: \(bundle.bundleURL)")
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw TestError.fileNotFound(fileName: fileName+".json")
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
