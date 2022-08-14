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
        let ciColor = CIColor(color: imageView.image!.averageColor!)
            
        // get the current values and make the difference from white:
        let compRed: CGFloat = 1.0 - ciColor.red
        let compGreen: CGFloat = 1.0 - ciColor.green
        let compBlue: CGFloat = 1.0 - ciColor.blue
            
        self.view.backgroundColor = UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
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


//
// Credit: https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage
//
extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

