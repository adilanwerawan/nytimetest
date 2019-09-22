//
//  NyDetialsVC.swift
//  NYTimesPopularTest
//
//  Created by Adil Anwer on 9/10/19.
//  Copyright © 2019 Adil Anwer. All rights reserved.
//

import UIKit

class NyDetialsVC: BaseVC , StoryBoardHandler{
    
    //MARK: - Storyboard name
    static var myStoryBoard: (forIphone: String, forIpad: String?) = (Storyboards.MainStoryboad.rawValue, nil)

    //MARK :- IBOutlets
    @IBOutlet weak var nytArticleImage: UIImageView?
    @IBOutlet weak var nytArticleDate: UILabel?
    @IBOutlet weak var nytArticleHeading: UILabel?
    @IBOutlet weak var nytArticleDetails: UILabel?
    @IBOutlet weak var nytArticleBy: UILabel?
    @IBOutlet weak var linkTextView: UITextView?
    
    //MARK :- Variables
    var articleDetails:NyResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Airport Details"
        
        self.nytArticleHeading?.text = self.articleDetails?.title ?? ""
        self.nytArticleDate?.text = self.articleDetails?.publishedDate ?? ""
        self.nytArticleDetails?.text = self.articleDetails?.abstractField ?? ""
        self.nytArticleBy?.text = self.articleDetails?.byline ?? ""
        self.linkTextView?.text = self.articleDetails?.url ?? "Link is not available"
        guard let media = self.articleDetails?.media?[0].mediametadata?[0] else {
            
            return
        }
        self.nytArticleImage?.kf.setImage(with: URL.init(string: media.url ?? ""), placeholder: UIImage.init(named: "placeholder"))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

