//
//  UIViewController+Context.swift
//  cuidandoDoBairro
//
//  Created by Wilson Tanaka Pereira dos reis junior on 30/09/23.
//

import CoreData
import UIKit

extension UIViewController{
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentConatainer.viewContext
    }
}

