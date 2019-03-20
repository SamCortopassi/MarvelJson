//
//  ViewController.swift
//  MarvelJson
//
//  Created by Samantha Cortopassi on 3/19/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let kind: String?
    let data: [Text]?
//    let data: [Details]?
}

struct Text: Decodable {
    let mohash: String?
    let dist: Int?
    let children: [Children]?
}

struct Children: Decodable {
    let kind: String?
    let data: [Contex]?
}
struct Contex: Decodable {
    let subredit: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let jasonUrlString = "https://www.reddit.com/r/marvelstudios.json"
        
        guard let url = URL(string: jasonUrlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }
            
            do {
                let movies = try JSONDecoder().decode([WebsiteDescription].self, from: data)
                print(movies[0])
                
            } catch let jsonErr {
                print("error serializing", jsonErr)
            }
            
        }.resume()
    }
}

