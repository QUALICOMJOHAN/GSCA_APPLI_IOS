//
//  Membre.swift
//  GSCA
//
//  Created by Johan Joulkva on 25/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit
import ObjectMapper

class Membre: Mappable {
    
    var id:Int?
    var img_logo:String?
    var nom_societe:String?
    var prenom_contact:String?
    var des_societe:String?
    var adresse_societe:String?
    var tel_societe:String?
    var mail_societe:String?
    var img_profil:String?
    var nom_contact:String?
    var statut_contact:String?
    var tel_contact:String?
    var mail_contact:String?
    var secteur_activite:String?
    var activite_principal:String?
    var site_societe:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.img_logo <- map["img_logo"]
        self.img_profil <- map["img_profil"]
        self.nom_societe <- map["nom_societe"]
        self.nom_contact <- map["nom_contact"]
        self.site_societe <- map["site_societe"]
        self.prenom_contact <- map["prenom_contact"]
        self.des_societe <- map["des_societe"]
        self.adresse_societe <- map["adresse_societe"]
        self.tel_societe <- map["tel_societe"]
        self.mail_societe <- map["mail_societe"]
        self.statut_contact <- map["statut_contact"]
        self.tel_contact <- map["tel_contact"]
        self.mail_contact <- map["mail_contact"]
        self.secteur_activite <- map["secteur_activite"]
        self.activite_principal <- map["activite_principal"]
    }
    
}
