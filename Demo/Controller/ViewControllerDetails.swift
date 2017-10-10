//
//  ViewControllerDetails.swift
//  Demo
//
//  Created by Raquel on 9/10/17.
//  Copyright © 2017 Raquel. All rights reserved.
//

import UIKit

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var textDetail: UILabel!
    
    var getImage = UIImage()
    var details = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageDetail.image = getImage
        textDetail.text! = details
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
