//
//  searchclub.swift
//  GSCA
//
//  Created by Johan Joulkva on 24/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class searchclub: UIViewController {

    @IBOutlet weak var validclub: UIButton!
    
    @IBOutlet weak var inputclub: UITextField!
    
    let urlKey = "URL"
    let nameKey = "NAME"
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        Alamofire.request("https://qualicom-conseil.com/GSCA_Teleconseil/webService/base_club.php?login=\(inputclub.text ?? "")").responseJSON { response in
            if let result = response.result.value {
                
                let json = JSON(result)

                if(json["login_club"].exists()){
                    
                    let preferences = UserDefaults.standard
                
                    let url = json["nom_base"].string! as NSString
                    let name = json["login_club"].string! as NSString
                    
                    preferences.set(url, forKey: self.urlKey)
                    preferences.set(name, forKey: self.nameKey)
                
                    let didSave = preferences.synchronize()
                    
                    if !didSave {}
                    
                    ClubSingleton.instance.nom = name as String
                    ClubSingleton.instance.url = url as String
                    
                    self.performSegue(withIdentifier: "searchmember", sender: self)
                    
                
                }
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: self.urlKey) != nil {
            let url = preferences.string(forKey: self.urlKey)
            let name = preferences.string(forKey: self.nameKey)
            
            ClubSingleton.instance.nom = name as! String
            ClubSingleton.instance.url = url as! String
            
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "searchmember", sender: self)
            }
        
        }
        
    }
    
}
