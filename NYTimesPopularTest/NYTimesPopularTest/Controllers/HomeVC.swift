//
//  HomeVC.swift
//  Airports
//
//  Created by Adil Anwer on 9/10/19.
//  Copyright © 2019 Adil Anwer. All rights reserved.
//

import UIKit

class NyHomeVC: UIViewController , StoryBoardHandler{
    
    //MARK: - Storyboard name
    static var myStoryBoard: (forIphone: String, forIpad: String?) = (Storyboards.MainStoryboad.rawValue, nil)
    //MARK :- IBOutlets
    @IBOutlet weak var citiesTable: UITableView?
    
    //MARK :- Variables
    let manager = AirportsManager()
    
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
        
        self.title = "Airports"
        
        let requestParam = self.manager.getAirportParams()
        
        //Airports api call
        self.manager.api(requestParam, completion: {
            
            if self.manager.isSuccess {
                
                DispatchQueue.main.async {
                    
                    self.citiesTable?.reloadData()
                }
            }
        })
    }
}

extension NyHomeVC : UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return self.manager.airportResponce?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        
        
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}

