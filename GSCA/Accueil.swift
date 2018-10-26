//
//  Accueil.swift
//  GSCA
//
//  Created by Johan Joulkva on 26/10/2018.
//  Copyright © 2018 JOHAN QUALICOM. All rights reserved.
//

import UIKit

class Accueil: UIViewController {

    @IBOutlet weak var bonjour: UITextView!
    @IBOutlet weak var club: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bonjour.text = "Bonjour \(MembreSingleton.instance.membre!.nom_contact!) \(MembreSingleton.instance.membre!.prenom_contact!)"
        
        club.text = "\(ClubSingleton.instance.nom)"
        
    }
}
