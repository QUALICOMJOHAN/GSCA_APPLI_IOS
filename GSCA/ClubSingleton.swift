//
//  ClubSingleton.swift
//  GSCA
//
//  Created by Johan Joulkva on 24/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit

class ClubSingleton: NSObject {
    
    static let instance = ClubSingleton(nom: "", url: "");
    
    var nom:String;
    var url:String;
    
    private init(nom:String, url:String){
        self.nom = nom;
        self.url = url;
    }
    
}
