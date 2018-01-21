//
//  GSCarouselViewController.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 21/01/18.
//  Copyright © 2018 Sripad, Gurunath. All rights reserved.
//

import UIKit

class GSCarouselViewController: UIViewController {

    var carouselTitle:String?
    var carouselImage:UIImage?
    @IBOutlet weak var carouselImageView: UIImageView!
    @IBOutlet weak var carouselTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func configureViewController() {
        carouselImageView.image = carouselImage
        carouselTitleLabel.text = carouselTitle
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
