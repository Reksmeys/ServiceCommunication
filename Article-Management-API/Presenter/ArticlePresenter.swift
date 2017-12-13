//
//  ArticlePresenter.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
class ArticlePresenter: ArticleServiceProtocol {
    
    
    // A delegate for response to other controller that call it
    var delegate: ArticlePresenterProtocol?
    var articleService: ArticleService?
    init(){
        self.articleService = ArticleService()
        self.articleService?.delegate = self
    }
     //presenter request to service method (getArticle)
    //and then response to other controller
    func responseArticle(article: [Article]) {
        self.delegate?.responseArticle(article: article)
    }
    func getArticle(page: Int, limit: Int){
        self.articleService?.getArticle(page: page, limit: limit)
    }
    func responseMsg(msg: String) {
        //response sth
    }
    func deleteArticle(id: Int){
        self.articleService?.deleteArticle(id: id)
    }
}
