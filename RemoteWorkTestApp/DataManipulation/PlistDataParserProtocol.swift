//
//  PlistDataParserProtocol.swift
//  RemoteWorkTestApp
//
//  Created by Mikhail Kirillov on 05/09/2018.
//  Copyright © 2018 Mikhail Kirillov. All rights reserved.
//

import Foundation

protocol PlistDataParser {
    associatedtype Element
    
    init(plistFileName: String)
    init(dataArray: NSArray)
    
    static func parseDataArray(_ array: NSArray) -> [Element]
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
