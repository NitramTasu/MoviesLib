//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

class MoviesTableViewController: UITableViewController {
    
    //var movies: [Movie] = []
    var fetchedResultsController: NSFetchedResultsController<Movie>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        
        if let indexPath = tableView.indexPathForSelectedRow,
            let movieVC = segue.destination as? MovieViewController{
            let movie = fetchedResultsController.object(at: indexPath)
            movieVC.movie = movie
        }
    }
    
    func loadMovies(){
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sortDecriptor = NSSortDescriptor(key: title, ascending: true)
        fetchRequest.sortDescriptors = [sortDecriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do{
            try fetchedResultsController.performFetch()
        }catch{
            print(error)
        }
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let movie = fetchedResultsController.object(at: indexPath)
            context.delete(movie)
            do{
                try context.save()
            }catch{
                print(error)
            }
            
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoviewCellTableViewCell
        
        
//        cell.textLabel?.text = ""
//        cell.detailTextLabel?.text = ""
//
//        let movie = movies[indexPath.row]
//
//        cell.textLabel?.text = movie.title
//        cell.detailTextLabel?.text = movie.duration

        let movie = fetchedResultsController.object(at: indexPath)
        cell?.prepare(with: movie)
        
        return cell!
    }
    
}


extension MoviesTableViewController: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
