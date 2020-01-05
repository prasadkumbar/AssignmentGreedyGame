//
//  ViewController.swift
//  AssignmentGreedyGame
//
//  Created by I0039 on 04/01/20.
//  Copyright © 2020 I0039. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var downloadImage: UIImageView!
    
     let remoteImageURL = URL(string: "https://images.unsplash.com/5/unsplash-bonus.jpg?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb")!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadingImage()
        
    }

   
            func downloadingImage(){
             // Use Alamofire to download the image
             Alamofire.request(remoteImageURL).responseData { (response) in
                if response.error == nil {
                     print(response.result)
    
                     // Show the downloaded image:
                     if let data = response.data {
                        self.downloadImage.image = UIImage(data: data)
                    }
                 }
            
             }
    }
}

extension ViewController{
    
}
