//
//  ViewController.swift
//  Demo
//
//  Created by Raquel on 6/10/17.
//  Copyright © 2017 Raquel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let list = ["Personas", "Animales", "Otros"]
    
    var myIndex = 0
    @IBOutlet weak var myTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "categoryCell") as! CategoryTableViewCell
//        cell.textLabel?.text = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryTableViewCell
        cell.nameLabel.text = list[indexPath.row]
        
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTable.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "move", sender: self)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
        if identifier == "move"{
            print("ir a coleccion")
            
            let collectionViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionController") as! CollectionController
            
            collectionViewController.choiceIndex = myIndex
            
            //self.present(collectionViewController, animated: true, completion: nil)
            
            if let navigationController = self.navigationController{
                navigationController.pushViewController(collectionViewController, animated: true)
            }else{
                print("NO HAY UN NAVIGATION CONTROLLER")
            }
            
        }
        
    }
    

}

