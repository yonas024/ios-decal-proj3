//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]! = []
    
    override func viewDidLoad() {
        //print("view did load")
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)

    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (photos != nil) {
            return photos.count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ViewCell
        
        let link = NSURL(string: self.photos[indexPath.row].url)!
        
        //print(self.photos[indexPath.row].url);
        
        let data = NSData(contentsOfURL: link)!
        let image = UIImage(data: data)
        let View=UIView()
        
        View.backgroundColor = UIColor(patternImage:image!)
        cell.backgroundView=View
        loadImageForCell(self.photos[indexPath.row], imageView: cell.image)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage" {
            let indexpaths = collectionView?.indexPathsForSelectedItems()
            let indexpath = indexpaths![0] as NSIndexPath
            let s = segue.destinationViewController as! NewViewController
            
            let link = NSURL(string: photos[indexpath.row].url)!
            let data = NSData(contentsOfURL: link)!
            let image = UIImage(data: data)

            s.image2 = image!
            
            //print(s.username)
            //print(photos[indexpath.row].username)
            
            s.current = photos[indexpath.row]
        }
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        
        let link = NSURL(string: photo.url)!
        let data = NSData(contentsOfURL: link)!
        imageView.image = UIImage(data: data)
    }
    
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        //print("didLoadPhotos")
        //print(photos)
        //print(self.photos)
        self.collectionView!.reloadData()
    }
    
}

