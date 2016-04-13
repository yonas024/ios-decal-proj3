//
//  NewViewController.swift
//  Photos
//
//  Created by Yonas Kbrom on 4/13/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var heart: UIButton!
    
    var image2 = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.image.image = self.image2
    }
    
    
}