//
//  Petition.swift
//  Project7
//
//  Created by Christopher Aronson on 12/9/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
