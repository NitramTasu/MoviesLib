//
//  UIViewController+CoreData.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 18/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController{
    var context: NSManagedObjectContext{
        let appDelete = UIApplication.shared.delegate as! AppDelegate
        appDelete.persistentContainer.viewContext
        return appDelete.persistentContainer.viewContext
    }
}
