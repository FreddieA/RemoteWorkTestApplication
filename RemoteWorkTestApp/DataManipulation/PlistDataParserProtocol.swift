//
//  PlistDataParserProtocol.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

protocol PlistDataParser {
    init(plistFileName: String)
    init(dataArray: NSArray)
    
    static func parseDataArray<T>(_ array: NSArray) -> [T]
}

extension PlistDataParser {
    init(plistFileName: String) {
        guard let path = Bundle.main.path(forResource: plistFileName, ofType: "plist"),
            let myDict = NSArray(contentsOfFile: path) else {
                self.init(dataArray: [])
                return
        }
        self.init(dataArray: myDict)
    }
}
