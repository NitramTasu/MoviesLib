//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategoria: UILabel!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbSinopse: UITextView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            //ivPoster.image = UIImage(named: movie.image)
            lbTitle.text = movie.title
            lbDuration.text = movie.duration
            lbNota.text = "⭐️ \(movie.rating)/10"
            lbSinopse.text = movie.summary
            lbCategoria.text = movie.categories            
            
        }
    }

    func loadMovies(){
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            return
        }
        do{
            let jsonData  = try Data(contentsOf: jsonURL)
            
            //let jsonDecoder = JSONDecoder()
            //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            //movies = try JSONDecoder().decode([Movie].self, from: jsonData)
            
//            movies.forEach{(movie) in
//                print(movie.title)
//            }
            
        }catch{
            print(error)
        }
    }
}

