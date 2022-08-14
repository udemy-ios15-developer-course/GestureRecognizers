//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by Chris Hand on 8/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageText: UILabel!
    private var index = 0
    private var collection = [ImageCollection]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        index = 0
        collection.append(ImageCollection(image: UIImage(named: "family")!, title: "Family"))
        collection.append(ImageCollection(image: UIImage(named: "stella")!, title: "Stella"))
        collection.append(ImageCollection(image: UIImage(named: "wallpaper")!, title: "Wallpaper"))
        
        imageView.image = collection[index].image
        imageText.text = collection[index].title
    }
                                                       
    @objc
    private func changePicture() {
        index += 1
        if index >= collection.count {
            index = 0
        }
        
        imageView.image = collection[index].image
        imageText.text = collection[index].title
    }
    
    private struct ImageCollection {
        var image: UIImage
        var title: String
    }
}

