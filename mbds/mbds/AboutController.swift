//
//  AboutController.swift
//  mbds
//
//  Created by mbdse on 23/02/2022.
//

import Foundation
import UIKit

class AboutController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        image.image = UIImage(named: "logo-1")
    }

   
}
