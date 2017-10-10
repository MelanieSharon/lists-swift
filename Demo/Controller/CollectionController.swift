//
//  CollectionController.swift
//  Demo
//
//  Created by Raquel on 6/10/17.
//  Copyright © 2017 Raquel. All rights reserved.
//

import UIKit

class CollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let persons = ["person1","person2", "person3"]
    var images = ["pet1", "pet2", "pet3"]
    let others = ["pet3", "person3", "pet2"]
    
    var myIndex = 0
    @IBOutlet weak var MycollectionView: UICollectionView!
    var choiceIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MycollectionView.register(UINib(nibName: "CollectionViewCellP", bundle: nil), forCellWithReuseIdentifier: "collectionCatg")

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if choiceIndex == 0 {
            return persons.count
        } else if choiceIndex == 1 {
            return images.count
        }
        return others.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCatg", for: indexPath) as! CollectionViewCellP
        
        if choiceIndex == 0 {
            cell.myImage.image = UIImage(named: persons[indexPath.row])
        }else if choiceIndex == 1 {
            cell.myImage.image = UIImage(named: images[indexPath.row])
        }else {
            cell.myImage.image = UIImage(named: others[indexPath.row])
        }
        
        cell.myImage.contentMode = .scaleAspectFit
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        myIndex = indexPath.row
       performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "segue"{
            print("ir a Detalle")
            
            let viewControllerDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerDetails") as! ViewControllerDetails
            
            if choiceIndex == 0 {
                viewControllerDetail.getImage = UIImage(named: persons[myIndex])!
                if myIndex == 0 {
                    viewControllerDetail.details = String("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.")
                } else if myIndex == 1 {
                    viewControllerDetail.details = String("Blusa")
                } else {
                    viewControllerDetail.details = String("Polo Rosa")
                }
                
            } else if choiceIndex == 1 {
                viewControllerDetail.getImage = UIImage(named: images[myIndex])!
                if myIndex == 0 {
                    viewControllerDetail.details = String("Buldog")
                } else if myIndex == 1 {
                    viewControllerDetail.details = String("Gato blanco")
                } else {
                    viewControllerDetail.details = String("Gato plomo")
                }
            } else {
                viewControllerDetail.getImage = UIImage(named: others[myIndex])!
                if myIndex == 0 {
                    viewControllerDetail.details = String("Gato plomo")
                } else if myIndex == 1 {
                    viewControllerDetail.details = String("Polo Rosa")
                } else {
                    viewControllerDetail.details = String("Gato blanco")
                }

            }
            
            //self.present(collectionViewController, animated: true, completion: nil)
            
           if let navigationController = self.navigationController{
                navigationController.pushViewController(viewControllerDetail, animated: true)
            }else{
                print("NO HAY UN NAVIGATION CONTROLLER")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
