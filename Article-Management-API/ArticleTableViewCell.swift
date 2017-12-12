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


        }
        
        
    }


}
