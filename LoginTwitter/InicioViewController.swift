//
//  InicioViewController.swift
//  LoginTwitter
//
//  Created by Jorge M. B. on 05/04/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import TwitterKit
class InicioViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var usuario : String!
    var nombre : String!
    var imagenUrl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username.text = usuario
        name.text = nombre
        let url = try? Data(contentsOf: URL(string: imagenUrl)!)
        imagen.image = UIImage(data: url!)
    }

    @IBAction func salir(_ sender: UIButton) {
        let store = TWTRTwitter.sharedInstance().sessionStore
        if let userID = store.session()?.userID {
            store.logOutUserID(userID)
            dismiss(animated: true, completion: nil)
        }
    }
    

}
