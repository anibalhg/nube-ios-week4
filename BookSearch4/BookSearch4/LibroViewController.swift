//
//  LibroViewController.swift
//  BookSearch3
//
//  Created by Dev on 2/3/16.
//  Copyright © 2016 Dev. All rights reserved.
//

import UIKit

class LibroViewController: UIViewController {
    
    @IBOutlet weak var lblISBN: UILabel!

    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblAutores: UILabel!
    
    @IBOutlet weak var imgPortada: UIImageView!
    
    var libro: Libro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.makeToastActivity()
        
        lblISBN.text = libro.isbn!
        lblAutores.text = libro.autores!
        lblTitulo.text = libro.titulo!
        
        if let imagen = libro.imagen {
            let url = NSURL(string: imagen)
            if let img = NSData(contentsOfURL: url!) {
                self.imgPortada.image = UIImage(data: img)
            }
            else {
                self.imgPortada.image = nil
            }
        }
        else {
            self.imgPortada.image = nil
        }
        
        self.view.hideToastActivity()
    }

}
