//
//  Data.swift
//  Todoey
//
//  Created by Carlos Cobian on 21/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
