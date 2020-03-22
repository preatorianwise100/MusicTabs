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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
}
