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
  
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listObj = viewModelMusic.arrayOfList[(tableView.indexPathForSelectedRow?.row)!]
        if let destination = segue.destination as? ViewControlDetails{
            destination.nameString = listObj.collectionName
            destination.imageString = listObj.artworkUrl100
        }
    }
    
    
}
