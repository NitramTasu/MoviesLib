//
//  MovieRegisterViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 18/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

class MovieRegisterViewController: UIViewController {
    
    var movie: Movie?

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtRating: UITextField!
    @IBOutlet weak var txtDuration: UITextField!
    @IBOutlet weak var txtCategories: UITextField!
    @IBOutlet weak var txtSumary: UITextView!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            txtTitle.text = movie.title
            txtRating.text = "\(movie.rating)"
            txtDuration.text = movie.duration
            txtCategories.text = movie.categories
            txtSumary.text = movie.summary
            btnRegister.setTitle("Alterar", for: .normal)
        }
    }

    @IBAction func addEditMovie(_ sender: Any) {
        
        if movie == nil{
            movie = Movie(context: context)
        }
        
        movie?.title = txtTitle.text
        movie?.rating = Double(txtRating.text!) ?? 0
        movie?.duration = txtDuration.text
        movie?.categories = txtCategories.text
        movie?.summary = txtSumary.text
        
        do{
            try context.save()
            navigationController?.popViewController(animated: true)
        }catch{
            print(error)
        }
        
    }
}
