//
//  NyHomeVC.swift
//  NYTimesPopularTest
//
//  Created by Adil Anwer on 9/22/19.
//  Copyright © 2019 Adil Anwer. All rights reserved.
//


import UIKit

class NyHomeVC: BaseVC , StoryBoardHandler{
    
    //MARK: - Storyboard name
    static var myStoryBoard: (forIphone: String, forIpad: String?) = (Storyboards.MainStoryboad.rawValue, nil)
    //MARK :- IBOutlets
    @IBOutlet weak var nyArticlesTable: UITableView?
    
    //MARK :- Variables
    let manager = NYTMostPopularApiManager()
    
    //MARK :- ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
        self.nyArticlesTable?.register(UINib(nibName: CellNames.NyHomeCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIds.NyHomeCellId.rawValue)
        
        self.title = " NY Times Most Popular Articles"
        
        let requestParam = self.manager.getNYTParams()
        
        //Airports api call
        self.manager.api(requestParam, completion: {
            
            if self.manager.isSuccess {
                
                DispatchQueue.main.async {
                    
                    self.nyArticlesTable?.reloadData()
                }
            }
        })
    }
}

extension NyHomeVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.manager.nytResponce?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: CellIds.NyHomeCellId.rawValue, for: indexPath) as! NyHomeCell
        
        let article = self.manager.nytResponce?.results?[indexPath.row]
        cell.config(article: article)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.nyArticlesTable?.deselectRow(at: indexPath, animated: true)
        let article = self.manager.nytResponce?.results?[indexPath.row]
        let nyDetailsVC = NyDetialsVC.loadVC()
        nyDetailsVC.articleDetails = article
        self.navigationController?.pushViewController(nyDetailsVC, animated: true)
    }
    
}

