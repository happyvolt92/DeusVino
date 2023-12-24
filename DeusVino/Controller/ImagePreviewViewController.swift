//
//  ImagePreviewViewController.swift
//  DeusVino
//
//  Created by Elodie Gage on 24/12/2023.
//

import Foundation
import UIKit

class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!

    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

    @IBAction func startSearchButtonPressed(_ sender: UIButton) {
        if let image = image {
            // Extraire le texte de l'image
            extractText(from: image)
        }
    }

    func extractText(from image: UIImage) {
        // implementation logique extraction text
        
    }
}
