//
//  DetailImageViewController.swift
//  AssignmentGreedyGame
//
//  Created by I0039 on 04/01/20.
//  Copyright © 2020 I0039. All rights reserved.
//

import UIKit

class DetailImageViewController: UIViewController {

    @IBOutlet weak var fullScreenImage: UIImageView!
    
    var emptyImage = UIImage()
   // var emptyString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenImage.image = emptyImage
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
