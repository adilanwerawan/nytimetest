//
//  BaseVC.swift
//  RestaurantsApp
//
//  Created by Adil Anwer on 6/1/18.
//  Copyright © 2018 Adil Anwer. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
//    var generalUtilities = GeneralUtilities()
    
    var baseVarCalledFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupAppDefaultNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark : Customizing navigation bar, adding bar buttons and custom title view
    func setupAppDefaultNavigationBar()  {
        
        //Setting navigation bar background color, its font and title color
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        
//        self.navigationController?.navigationBar.setCustomNavigationBarWith(navigationBarTintColor: barBgColor, navigationBarTitleFont: titleFont, navigationBarForegroundColor: UIColor.black)
//        self.navigationController?.view.backgroundColor = UIColor.white
//        self.navigationItem.hidesBackButton = true
        
        //If navigation controller have more than 1 view controller then add backbutton
        
        if self.baseVarCalledFrom == "Login"{
            
            self.baseVarCalledFrom = ""
        }
        else if self.navigationController != nil{
            
            if (self.navigationController?.viewControllers.count)! > 1{
                
                //Adding bar button items with given image and its position inside navigation bar and its selector
                BaseVC.addBarButtonItemWithImage((UIImage(named: "backIcon")?.maskWithColor(color: UIColor.black)?.withRenderingMode(.alwaysOriginal))!, CustomNavBarEnum.CustomBarButtonItemPosition.BarButtonItemPositionLeft, self, #selector(self.goBack), self)
            }
        }
    }
    
    //Pop view controller
    @objc func goBack() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

extension BaseVC{
    
    //Adding bar button items with given image and its position inside navigation bar and its selector
    static func addBarButtonItemWithImage<T: CustomNavBarProtocol>(_ image:UIImage,_ postion: T, _ target:UIViewController, _ selector:Selector,_ viewcontroller:UIViewController) {
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(image, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        btn1.addTarget(viewcontroller, action: selector, for: .touchUpInside)
        
        let item1 = UIBarButtonItem(customView: btn1)
        
        //        let freeSpaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        //        freeSpaceItem.width = CGFloat(padding);
        
        if let postion = postion as? CustomNavBarEnum.CustomBarButtonItemPosition {
            
            switch postion {
            case .BarButtonItemPositionLeft:
                
                if viewcontroller.navigationItem.leftBarButtonItem != nil{
                    
                    if (viewcontroller.navigationItem.leftBarButtonItems?.count)! > 0{
                        
                        viewcontroller.navigationItem.leftBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    viewcontroller.navigationItem.leftBarButtonItem = item1
                }
                
            case .BarButtonItemPositionRight:
                
                if viewcontroller.navigationItem.rightBarButtonItem != nil{
                    
                    if (viewcontroller.navigationItem.rightBarButtonItems?.count)! > 0{
                        
                        viewcontroller.navigationItem.rightBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    viewcontroller.navigationItem.rightBarButtonItem = item1
                }
            }
        }
    }
    
    static func addBarButtonItemWithTitle<T: CustomNavBarProtocol>(_ title:String,_ postion: T, _ target:UIViewController, _ selector:Selector,_ viewcontroller:UIViewController) {
        
        let btn1 = UIButton(type: .custom)
        btn1.setTitle(title, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 80, height: 22)
        btn1.addTarget(viewcontroller, action: selector, for: .touchUpInside)
        btn1.setTitleColor(UIColor.black, for: .normal)
//        btn1.titleLabel?.font = UIFont.getAppSFTextSemiboldFont(15.0)
        btn1.contentHorizontalAlignment = .right
        
        let item1 = UIBarButtonItem(customView: btn1)
        
        //        let freeSpaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        //        freeSpaceItem.width = CGFloat(padding);
        
        if let postion = postion as? CustomNavBarEnum.CustomBarButtonItemPosition {
            
            switch postion {
            case .BarButtonItemPositionLeft:
                
                if viewcontroller.navigationItem.leftBarButtonItem != nil{
                    
                    if (viewcontroller.navigationItem.leftBarButtonItems?.count)! > 0{
                        
                        viewcontroller.navigationItem.leftBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    viewcontroller.navigationItem.leftBarButtonItem = item1
                }
                
            case .BarButtonItemPositionRight:
                
                if viewcontroller.navigationItem.rightBarButtonItem != nil{
                    
                    if (viewcontroller.navigationItem.rightBarButtonItems?.count)! > 0{
                        
                        viewcontroller.navigationItem.rightBarButtonItems?.append(item1)
                    }
                }
                else{
                    
                    viewcontroller.navigationItem.rightBarButtonItem = item1
                }
            }
        }
    }
}




//Mark : - Custom delegate for accessing diferrent properties of navigation bar
protocol CustomNavBarProtocol { }

enum CustomNavBarEnum: CustomNavBarProtocol {
    
    enum CustomBarButtonItemPosition: Int, CustomNavBarProtocol {
        
        case  BarButtonItemPositionRight = 1
        case  BarButtonItemPositionLeft = 2
    }
}

//Customzing default navigation bar appearence
extension UINavigationBar
{
    
    func setCustomNavigationBarWith(navigationBarTintColor color:UIColor, navigationBarTitleFont titleFont:UIFont, navigationBarForegroundColor foregroundColor:UIColor)
    {
        
        //165    77    52
        barTintColor = color
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.font: titleFont]
        titleTextAttributes = (titleDict as! [NSAttributedString.Key : Any])
    }
}



