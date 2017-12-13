//
//  ArticleServiceProtocol.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

protocol ArticleServiceProtocol {
    func responseArticle(article: [Article])
    func responseMsg(msg: String)
}
