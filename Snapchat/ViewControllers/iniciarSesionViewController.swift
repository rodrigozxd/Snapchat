//
//  ViewController.swift
//  Snapchat
//
//  Created by RodrigoParedes on 27/10/21.
//  Copyright © 2021 RodrigoParedes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil {
                print("Se presento el siguiente error \(String(describing: error))")
                let alerta = UIAlertController(title: "Error", message: "No esxite el usuario.", preferredStyle: .alert)
                let btnCrear = UIAlertAction(title: "Crear", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "crearUsuario", sender: nil)
                })
                let btnCerrar = UIAlertAction(title: "Cerrar", style: .default, handler: { (UIAlertAction) in
                })
                alerta.addAction(btnCrear)
                alerta.addAction(btnCerrar)
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("Inicio de Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    @IBAction func crearUsuario(_ sender: Any) {
        self.performSegue(withIdentifier: "crearUsuario", sender: nil)
    }
}

