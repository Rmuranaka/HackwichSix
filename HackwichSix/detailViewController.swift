//
//  detailViewController.swift
//  HackwichSix
//
//  Created by Ryan Muranaka on 4/3/19.
//  Copyright © 2019 Ryan Muranaka. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    //Create a variable that can receive the String holding the name of the image the first viewcontrooler (the one with the table view)
    var imagePass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set our image to display in the image view
        if let imageName = imagePass{
            imageView.image = UIImage(named: imageName)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
