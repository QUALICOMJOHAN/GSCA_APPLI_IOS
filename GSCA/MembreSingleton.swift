//
//  MembreSingleton.swift
//  GSCA
//
//  Created by Johan Joulkva on 25/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit

class MembreSingleton: NSObject {
    
    static let instance = MembreSingleton();
    
    var membre:Membre?;
    
    private override init(){
    
    }
    
}
