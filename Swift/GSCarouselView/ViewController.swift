//
//  ViewController.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 12/12/17.
//  Copyright © 2017 Sripad, Gurunath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carouselView: GSCarousalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.delegate = self
        carouselView.images = [#imageLiteral(resourceName: "background-image"),#imageLiteral(resourceName: "background-image"),#imageLiteral(resourceName: "background-image"),#imageLiteral(resourceName: "background-image"),#imageLiteral(resourceName: "background-image")]
        carouselView.titles = ["First slide", "Second slide", "Third slide", "Fourth slide", "Fifth slide"]
        carouselView.configureCarousalView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:GSCarouselViewDelegate {
    func swipedAllViewControllers() {
        print("Completed all view controllers")
    }
    
    func swipedViewControllerAtIndex(_ index: Int) {
        print("Swiped view at index \(index)")
    }
}
