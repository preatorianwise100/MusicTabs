//
//  ViewControlMusic.swift
//  MusicTags
//
//  Created by Jose David Bustos H on 3/21/20.
//  Copyright © 2020 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class ViewControlMusic: UIViewController,UITableViewDataSource ,UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var  viewModelMusic = MusicViewModel()
    var filteredExercises = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        viewModelMusic.downloadMusicPopularAll()
        closureSetUp()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableViewSetup()  {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    func closureSetUp()  {
        viewModelMusic.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                // self?.activityIndicator.stopAnimating()
            }
        }
        viewModelMusic.errorMessage = { [weak self] (message)  in
            DispatchQueue.main.async {
                print(message)
                // self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelMusic.arrayOfList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCellMusic else { return UITableViewCell() }
        
        let listObj = viewModelMusic.arrayOfList[indexPath.row]
        
        cell.LblTrackName.text = listObj.trackName
        cell.LblArtistName.text =  listObj.artistName
        
        var paths = listObj.artworkUrl100
        if let imageURL = URL(string:paths!) {
            print(imageURL)
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imagenView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("deberia abrir Details")
        
        performSegue(withIdentifier: "showDetails", sender: self)
        
//       let listObj = viewModelMusic.arrayOfList[indexPath.row]
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewControlDetails")  as! ViewControlDetails
////        myVC.nameString = listObj.collectionCensoredName
////        myVC.decripString = listObj.artistName
////        myVC.imageString = listObj.artworkUrl100
//        let navController = UINavigationController(rootViewController: myVC)
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: ViewControlDetails.self, action: nil)
//        self.navigationController?.present(navController, animated: true, completion: nil)
        
        
    }
    
    func someMethodIWantToCall(cell: UITableViewCell) {
        //        print("Inside of ViewController now...")
        
        // we're going to figure out which name we're clicking on
        
        //        guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
        //
        //        let contact = twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row]
        //        print(contact)
        //
        //        let hasFavorited = contact.hasFavorited
        //        twoDimensionalArray[indexPathTapped.section].names[indexPathTapped.row].hasFavorited = !hasFavorited
        //
        //        //        tableView.reloadRows(at: [indexPathTapped], with: .fade)
        //
        //        cell.accessoryView?.tintColor = hasFavorited ? UIColor.lightGray : .red
    }
    
}
