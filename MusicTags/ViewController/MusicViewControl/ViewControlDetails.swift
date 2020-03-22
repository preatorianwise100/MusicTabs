//
//  ViewControlDetails.swift
//  MusicTags
//
//  Created by Jose David Bustos H on 3/21/20.
//  Copyright © 2020 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class ViewControlDetails: UIViewController {
    
    @IBOutlet weak var LblNameAlbum: UILabel!
    @IBOutlet weak var imagenDetails: UIImageView!
    @IBOutlet weak var ButtonVerOnline: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var imageString:String!
    var nameString:String!
   // var decripString:String!

    override func viewDidLoad() {
        super.viewDidLoad()
         updateUI()
        setButtonVer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setButtonVer()
    {
        ButtonVerOnline.layer.cornerRadius = 15
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        self.LblNameAlbum.text = nameString
        self.LblNameAlbum.numberOfLines = 6
        self.LblNameAlbum.lineBreakMode = .byWordWrapping
        
        let imgURL = URL(string:imageString)
        
        let data = NSData(contentsOf: (imgURL)!)
        self.imagenDetails.image = UIImage(data: data as! Data)
    }
    
}
