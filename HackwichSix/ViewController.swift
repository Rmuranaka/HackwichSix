//
//  ViewController.swift
//  HackwichSix
//
//  Created by Ryan Muranaka on 4/2/19.
//  Copyright © 2019 Ryan Muranaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    //Declare an array and name it "myFriends"
    var myFriends = ["Kapolei Kapawai"]
    
    //Restaurant Image Data
    var restaurantImageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //Create a NSBundle object that enables us to create a pathway to our plist
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        //Intialize a dictionary using the keys and values found in a file that path
        let dict = NSDictionary(contentsOfFile: path!)
        //Set restaurantImageData to the dictionary object for key, "restaurantImages" in the plist
        restaurantImageData = dict!.object(forKey: "restaurantImages") as! [String]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be receated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create a constant called cell [local variable, only accessible in the function], each cell created it puts the name in the cell and continues the process
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        //take each item in the array and assign its to a row
        let text = myFriends[indexPath.row]
        //sets the cell to the text
        //textLabel [property].text[property] = text
        cell.textLabel?.text=text
        //returns the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indicates that a row has been selected
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
         //Create an IF statement that checkts the identifier of the Segue
        if segue.identifier == "mySegue"{
            //Set up the destination view controller where the data will be passed to the detailViewController
            let s1 = segue.destination as! detailViewController
            //create a variable that holds the index of the cell that's tapped
            let imageIndex = tableView.indexPathForSelectedRow?.row
            //Set the imagePass on the detailViewController to the corresponding String in the array that holding the names of our images in the pList
            s1.imagePass = restaurantImageData[imageIndex!]
        }
    }


}

