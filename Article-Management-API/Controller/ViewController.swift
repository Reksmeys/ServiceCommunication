//
//  ViewController.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ArticlePresenterProtocol {
  
    @IBOutlet weak var articleTableView: UITableView!
    var articlePresenter: ArticlePresenter?
    var articles: [Article]?
    var refreshControl:UIRefreshControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        self.articleTableView.addSubview(refreshControl!)
        articles = [Article]()
   
        self.articlePresenter = ArticlePresenter()
        self.articlePresenter?.getArticle(page: 3, limit: 17)
       // self.articlePresenter?.insertArticle(articles: articles)
        self.articlePresenter?.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (articles?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.configureArticleCell(article: articles![indexPath.row])
        return cell
    }
    func responseArticle(article: [Article]) {
        self.articles = article
        self.articleTableView.reloadData()
    }
    //call when table have been refresh
    func refreshData(){
        // configure sth
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "edit") { (action, indexPath) in
           //edit data
        }
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            //delete data
            let id = self.articles![indexPath.row].id
            self.articlePresenter?.deleteArticle(id: id!)
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Success", message: "msg", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        return [edit, delete]
    }
    
    func responseMessage(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Success", message: msg, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

