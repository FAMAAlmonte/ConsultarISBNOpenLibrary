//
//  ViewController.swift
//  ConsultarISBNOpenLibrary
//
//  Created by Mauro Alberto Flores Almonte on 14/08/16.
//  Copyright © 2016 Mauro Alberto Flores Almonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    


    @IBOutlet weak var errorEtiqueta: UITextView!

    
    @IBOutlet weak var mostrarTexto: UITextView!
    @IBOutlet weak var ISBNTextField: UITextField!
    
    
    /** captura el ISBN */
    @IBAction func capturaISBN(sender: AnyObject) {
        
        if ISBNTextField.text?.containsString(" ") == true {  //Evita el error de nil o caracteres distintos a numeros
            ISBNTextField.text? = ""
        } else {
            // Busqueda de la url
        var url = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + ISBNTextField.text!)
        var datos:NSData = NSData(contentsOfURL: url!)!
        var texto = NSString(data: datos, encoding: NSUTF8StringEncoding)
        
        
        
        if texto!.containsString("{}"){
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                // Error 
                self.errorEtiqueta.text = "¡ISBN, de libro No encontrado!,  ¡Intenta de nuevo, por favor!.  No debe contener espacios, guiones ó simbolos "
                
            }) } else {
            
            //  imprime la busqueda
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                print(texto)
                self.mostrarTexto.text! = texto as! String
                
            })
            }
        }
        
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
        
    }


}

