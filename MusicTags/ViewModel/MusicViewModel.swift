//
//  MusicViewModel.swift
//  MusicTags
//
//  Created by Jose David Bustos H on 3/21/20.
//  Copyright © 2020 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit

class  MusicViewModel {
    
    final let urlTotal = URL(string: "https://itunes.apple.com/search?term=Abba&mediaType=music&limit=20")
    final let urlSearch = URL(string: "https://itunes.apple.com/search?term=")
    final let urlMediaType = URL(string: "&mediaType=music&limit=20")
    
    
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    var arrayOfList : [Result] = []{
        
        didSet{
            reloadList()
        }
    }
    
    func downloadMusicPopularAll(){
        
        guard let downloadURL = urlTotal else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("algo fallo")
                return
            }
            print("descargado")
            do
            {
                
                //                let f = try JSONDecoder().decode([MusicModel].self, from: data)
                //                print(f)
                let decoder = JSONDecoder()
                let downloadedMusic = try decoder.decode(MusicModel.self, from: data)
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                {}
                self.arrayOfList = downloadedMusic.results
                print(self.arrayOfList)
                
            } catch {
                print("ocurrio un error despues de descarga")
            }
            }.resume()
        
        
    }
    func downloadMusicPopularByName(Name:String){
        
        let urlTotalSearch =  URL(string:"https://itunes.apple.com/search?term=" + Name  + "&mediaType=music&limit=20")
        
        guard let downloadURL = urlTotalSearch else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("algo fallo")
                return
            }
            print("descargado")
            do
            {
                let decoder = JSONDecoder()
                let downloadedMovies = try decoder.decode(MusicModel.self, from: data)
                
                self.arrayOfList = downloadedMovies.results
                print(self.arrayOfList)
                
            } catch {
                print("ocurrio un error despues de descarga")
            }
            }.resume()
        
        
    }
    
    
}
