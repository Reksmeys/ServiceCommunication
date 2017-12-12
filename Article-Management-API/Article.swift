//
//  Article.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class Article: Mappable {
    var id:Int?
    var title:String?
    var category:Category?
    var image:String?
    
    init() {
        self.category = Category()
    }
    required init?(map: Map) {}
    func mapping(map: Map) {
        id          <- map["ID"]
        title       <- map["TITLE"]
        category    <- map["CATEGORY"]
        image       <- map["IMAGE"]
    }
}


class Category: Mappable {
    var id:Int?
    var name:String?
    init() {
        
    }
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        id      <- map["ID"]
        name    <- map["NAME"]
    }
}
