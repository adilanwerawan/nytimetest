//
//  NyHomeCell.swift
//  NYTimesPopularTest
//
//  Created by Adil Anwer on 9/22/19.
//  Copyright © 2019 Adil Anwer. All rights reserved.
//

import UIKit
import Kingfisher

class NyHomeCell: UITableViewCell {

    //MARK :- IBOutlets
    @IBOutlet weak var articleImage: UIImageView?{
        
        didSet{
            
            articleImage?.round()
        }
    }
    
    @IBOutlet weak var articleTitleLbl: UILabel?
    @IBOutlet weak var articleByLbl: UILabel?
    @IBOutlet weak var articleDateLbl: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(article:NyResult?){
        
        if article != nil{
            
            self.articleTitleLbl?.text = article?.title ?? ""
            self.articleByLbl?.text = article?.byline ?? ""
            self.articleDateLbl?.text = article?.publishedDate ?? ""
            
            guard let media = article?.media?[0].mediametadata?[0] else {
                
                return
            }
            self.articleImage?.kf.setImage(with: URL.init(string: media.url ?? ""), placeholder: UIImage.init(named: "placeholder"))
        }
    }
    
}
