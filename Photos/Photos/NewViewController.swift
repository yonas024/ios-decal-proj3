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
    
    var image2 = UIImage()
    
    var current: Photo?
    
    var liked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = image2
        username.text = current!.username
        date.text = current!.date
        likes.text = "\(current!.likes)"
        liked = false
        
    }
    
    
    @IBAction func haction(sender: UIButton) {
        if liked == false{
            var myimage = UIImage(named: "red-heart.gif")
            myimage = myimage?.imageWithAlignmentRectInsets(UIEdgeInsetsMake(10, 10, 10, 10))
            sender.setImage(myimage, forState: .Normal)
            liked = true
        } else {
            var myimage = UIImage(named: "white-heart.gif")
            myimage = myimage?.imageWithAlignmentRectInsets(UIEdgeInsetsMake(10, 10, 10, 10))
            sender.setImage(myimage, forState: .Normal)
            liked = false
        }
    }
    
}