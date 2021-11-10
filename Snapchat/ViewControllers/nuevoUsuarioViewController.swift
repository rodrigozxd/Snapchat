//
//  nuevoUsuarioViewController.swift
//  Snapchat
//
//  Created by RodrigoParedes on 9/11/21.
//  Copyright © 2021 RodrigoParedes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class nuevoUsuarioViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnReguistrar(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            print("Intentando crear un usuario")
            if error != nil {
                print("Se presento el siguiente error al crear el usuario: \(String(describing: error))")
                let alerta = UIAlertController(title: "Error", message: "Se produjo un error al crear el usuario.", preferredStyle: .alert)
                let btnCerrar = UIAlertAction(title: "Cerrar", style: .default, handler: { (UIAlertAction) in
                })
                alerta.addAction(btnCerrar)
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("El usuario fue creado satisfactoriamente")
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario: \(self.emailTextField.text!) se creo perfectamente.", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "iniciosegue", sender: nil)
                })
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func volverbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
