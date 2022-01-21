//
//  Item.swift
//  Todoey
//
//  Created by Carlos Cobian on 21/01/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
