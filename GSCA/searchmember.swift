//
//  searchmember.swift
//  GSCA
//
//  Created by Johan Joulkva on 24/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class searchmember: UIViewController {
    
    @IBOutlet weak var inputid: UITextField!
    @IBOutlet weak var inputmdp: UITextField!
    
    let memberKey = "ID"
    

    @IBAction func click(_ sender: UIButton) {
    
        Alamofire.request("\(ClubSingleton.instance.url)loginMobil.php?login=\(inputid.text ?? "")&pass=\(inputmdp.text ?? "")").responseJSON { response in
            if let result = response.result.value {
                
                let json = JSON(result)
                
                print(json)
                print(result)
                
                if(json["id"].exists()){
                    
                    let preferences = UserDefaults.standard
                    
                    let id = json["id"].string! as NSString
                    
                    let membre = Mapper<Membre>().map(JSON: result as! [String : Any])
                    
                    MembreSingleton.instance.membre = membre
                    
                    preferences.set(id, forKey: self.memberKey)
            
                    let didSave = preferences.synchronize()
                    
                    if !didSave {}
                    
                    
                    
                    self.performSegue(withIdentifier: "accueil", sender: self)
                    
                }
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: self.memberKey) != nil {
            
            let id = preferences.string(forKey: self.memberKey)

            Alamofire.request("\(ClubSingleton.instance.url)webService/getMembre.php?id=\(id ?? "")").responseJSON { response in
                if let result = response.result.value {
                    
                    let json = JSON(result)
                    
                    let membre = Mapper<Membre>().map(JSON: result as! [String : Any])
                    
                    MembreSingleton.instance.membre = membre
                    
                    self.performSegue(withIdentifier: "accueil", sender: self)
            
                    }
                    
                }
            }
    
    }
}
