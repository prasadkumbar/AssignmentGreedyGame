//
//  ViewController.swift
//  AssignmentGreedyGame
//
//  Created by I0039 on 04/01/20.
//  Copyright © 2020 I0039. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ImageLoader
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var downloadImage: UIImageView!
    
    var albums = [AlbumModel]()
    var albumimages : AlbumModel? = nil
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAlamofire()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.albulId.text = albums[indexPath.row].id!.description
        if let imageurl = albums[indexPath.row].thumbnailUrl{
            Alamofire.request(imageurl).responseData(completionHandler: { (response) in
                //self.imageCache.setObject(response.data! as AnyObject, forKey: imageurl as AnyObject)
                
                if let image = response.result.value{
                    DispatchQueue.main.async {
                        cell.albumImage.image = UIImage(data: image)
                        self.imageCache.setObject(cell.albumImage.image!, forKey: imageurl as AnyObject)
                    }
//                    DispatchQueue.main.async {
//                        cell.albumImage.image = self.imageCache.object(forKey: imageurl as AnyObject) as? UIImage
//                        
//                    }
                    
                }
            })
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "show", sender: self)
        
    }
    func getAlamofire(){
        
        Alamofire.request(APIInterface.Base_URL + "/photos").responseJSON { (response) in
            
            switch response.result {
            case .success:
                if((response.result) != nil) {
                    let jsonData = response.data
                    print("jsonData")
                    do{
                        let decode = try JSONDecoder().decode([AlbumModel].self, from: jsonData!)
                        self.albums = decode
                         self.tableview.reloadData()
                        for reply in decode {
                            print(reply.albumId as Any)
                        }
                    }catch {
                        print("Error: \(error)")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableview.indexPathForSelectedRow
        let cell : Cell = self.tableview.cellForRow(at: indexPath!) as! Cell
        let vc = segue.destination as! DetailImageViewController
        vc.emptyImage = cell.albumImage.image!
    }
}
