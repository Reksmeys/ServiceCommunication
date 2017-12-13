//
//  ArticleTableViewCell.swift
//  Article-Management-API
//
//  Created by Raksmey on 12/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureArticleCell(article: Article){
        categoryLabel.text = article.category?.name
        titleLabel.text = article.title
        if let url = URL(string: article.image!){
            print("url img: \(article.image!)")
            self.pictureImageView.kf.setImage(with: article.image! as? Resource)
            self.pictureImageView.kf.base
          //app របស់យើង មិន crash បើទោះបីជា image resource អត់មានក៏ដោយ
//                let url = URL(string: article.image!)
//                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//                self.pictureImageView.image = UIImage(data: data!)
          
         // app អាចនឹង crash បើសិន image url ខុសឬ មិន មាន
            
            
            let resource = ImageResource(downloadURL: URL(string: "http://api-ams.me/image-thumbnails/thumbnail-e2142903-addd-4c50-9cd2-83b1393b3c7b.jpg")!, cacheKey: "profile")
            
            self.pictureImageView?.kf.setImage(with: resource)


        }
        

    }


}
