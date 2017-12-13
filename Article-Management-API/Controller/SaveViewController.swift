//
//  SaveViewController.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/12/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController, UIImagePickerControllerDelegate, ArticlePresenterProtocol {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    
    var articlePresenter: ArticlePresenter?
    var articleInsertUpdate: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        articlePresenter = ArticlePresenter()
        self.articlePresenter?.delegate = self

        if articleInsertUpdate != nil {
            self.titleTextField.text = articleInsertUpdate?.title
            if let url = URL(string: (articleInsertUpdate?.image)!) {
                self.articleImageView.kf.setImage(with: url)
            }
        }
        
     titleTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    func responseArticle(article: [Article]) {
        
    }

    @IBAction func saveButton(_ sender: Any) {
        let image = UIImageJPEGRepresentation(self.articleImageView.image!, 0.5)
        let article = Article()
        if articleInsertUpdate != nil {
            article.id = articleInsertUpdate?.id
        }else{
            article.id = 0
        }
        article.title = titleTextField.text
        self.articlePresenter?.insertUpdateArticle(article: article, img: image!)
        print("save have been click")
        
    }
    
    func responseMsg(msg: String) {
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
