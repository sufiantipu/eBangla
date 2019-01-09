//
//  Model.swift
//  eBangla
//
//  Created by Md Abu Sufian on 9/1/19.
//  Copyright © 2019 Md Abu Sufian. All rights reserved.
//

import Foundation

class Book {
    
    var name: String!
    var writer: String!
    var coverImage: String!
    
    
    init(name: String, writer: String, coverImage: String) {
        self.name = name
        self.writer = writer
        self.coverImage = coverImage
    }
}
