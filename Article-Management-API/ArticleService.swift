
//
//  ArticleService.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import Alamofire

class ArticleService{
    var article_get_url = "http://174.138.20.101:15000/v1/api/articles"
    var articel_post_url = "http://174.138.20.101:15000/v1/api/articles"
    var article_delete_url = "http://174.138.20.101:15000/v1/api/articles/"
    var upload_image_url = "http://174.138.20.101:15000/v1/api/uploadfile/single"
    var delegate:ArticleServiceProtocol?
    // ===========with alamofire ===============
    
    let headers = [
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":"Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="
    ]
  
    
    
    //===============get article=============
    func getArticle(page: Int, limit: Int){
        var articles = [Article]()
        //==without alamofire======
        /*
        let request_url = "\(article_get_url)?page=\(page)&limit=\(limit)"
        let url = URL(string: request_url)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]{
                    let dataArticle = json["DATA"] as! NSArray
                    //loop to get data
                    for obj in dataArticle{
                        articles.append(Article(JSON: obj as! [String:Any])!)
                        print("data:\(articles)")
                    }
                    self.delegate?.responseArticle(article: articles)
                }
            }
        }
        task.resume()*/
 
        
        //-----with alamofire-----------
        
        Alamofire.request("http://174.138.20.101:15000/v1/api/articles", method: .get, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any] {
                    let objects = json["DATA"] as! NSArray
                    for obj in objects {
                        articles.append(Article(JSON: obj as! [String:Any])!)
                    }
                    self.delegate?.responseArticle(article: articles)
                }
            }
        }
      
        
        
    }
    
    //-----------insert articles-------------
    
    func saveArticle(articles: Article){
        var newArticle: [String:Any] = [
            "TITLE": articles.title,
            "CATEGORY_ID": 1,
            "IMAGE": articles.image!
        ]
        let url = URL(string: articel_post_url)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        let jsonData = try? JSONSerialization.data(withJSONObject: newArticle, options: [])
        request.httpBody = jsonData
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil{
               //------------
                self.delegate?.responseMsg(msg: "Insert Success")
            }
        }
        task.resume()
    }
    
    //------insert and update article----------
    func insertAndUpdateArticles(articles: Article, img: Data){
        
    }
    
    //------- delete article ------------
    func deleteArticle(id:Int) {
       /*
         let url = URL(string: "\(article_delete_url)\(id)")
         var request = URLRequest(url: url!)
         request.httpMethod = "DELETE"
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
         request.addValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
         let session = URLSession.shared
         let task = session.dataTask(with: request) { (data, response, error) in
         if error == nil {
         self.delegate?.responseMsg(msg: "Delete Succesfully!")
         }
         }
         task.resume()
        */
        
        // ---- With Alamofire ------------
        
        Alamofire.request("\(article_delete_url)\(id)", method: .delete,
                          encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                self.delegate?.responseMsg(msg: "Delete Successfully!")
            }
        }
    }
}



