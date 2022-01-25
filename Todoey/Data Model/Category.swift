//
//  Category.swift
//  Todoey
//
//  Created by Carlos Cobian on 21/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var cellColor: String = ""
    let items = List<Item>()
    
}
