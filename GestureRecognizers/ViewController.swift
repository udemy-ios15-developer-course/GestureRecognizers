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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        imageView.image = UIImage(named: "family")
        imageText.text = "Family"
    }
}

