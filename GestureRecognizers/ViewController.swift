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
        collection.append(ImageCollection(image: "family", title: "Family"))
        collection.append(ImageCollection(image: "stella", title: "Stella"))
        collection.append(ImageCollection(image: "wallpaper", title: "Wallpaper"))
        
        setImage(index: index)
    }
    
    private func setImage(index: Int) {
        imageView.image = UIImage(named: collection[index].image)!
        imageText.text = collection[index].title
    }
                                                       
    @objc
    private func changePicture() {
        index += 1
        if index >= collection.count {
            index = 0
        }
        
        setImage(index: index)
    }
    
    private struct ImageCollection {
        var image: String
        var title: String
    }
}
                                          
/*
 Experimented with loading the images on demand, instead of all at once.
 I had 92.4MB when putting UIImage into the image collection. It went to 92.6MB whint I loaded created the UIImage on demand.
 I assume ios is being smart with it's resources. Probably if there were a lot of images, I wouldn't want to try to load them
    all in viewDidLoad?
 */

