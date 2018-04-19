//
//  ViewController.swift
//  LoginTwitter
//
//  Created by Jorge M. B. on 05/04/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import TwitterKit
class ViewController: UIViewController {
    
    var username : String!
    var name : String!
    var imagenUrl : String!
    var loginButton : TWTRLogInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton = TWTRLogInButton { (sesion, error) in
            if let sesion = sesion{
                let client = TWTRAPIClient()
                client.loadUser(withID: (sesion.userID), completion: { (user, error) in
                    self.name = user?.name
                    self.username = sesion.userName
                    self.imagenUrl = user?.profileImageURL
                    self.performSegue(withIdentifier: "enviar", sender: self)
                })
            }else{
                print("Error en el login")
            }
        }
        
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar"{
            let destino = segue.destination as! InicioViewController
            destino.nombre = name
            destino.usuario = username
            destino.imagenUrl = imagenUrl
        }
    }

   


}

