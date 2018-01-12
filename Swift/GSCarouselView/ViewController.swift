//
//  ViewController.swift
//  GSCarouselView
//
//  Created by Sripad, Gurunath on 12/12/17.
//  Copyright © 2017 Sripad, Gurunath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageViewController:UIPageViewController?
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageViewContainer: UIView!
    var numberOfPages: Int?
    var currentPage:Int?
    var viewControllers:Array<UIViewController>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configurePageViewController() {
        numberOfPages = 2
        currentPage = 0
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        pageViewController!.dataSource = self
        pageViewController!.delegate = self
    
        let firstWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "FirstCarousalViewController")
        let secondWalkthroughViewController = storyboard.instantiateViewController(withIdentifier: "SecondCarousalViewController")
        
        
        viewControllers = [firstWalkthroughViewController,secondWalkthroughViewController]
        pageViewController!.setViewControllers([firstWalkthroughViewController],direction:.forward,animated:true, completion: nil)
        
        self.addChildViewController(pageViewController!)
        
        pageViewController?.didMove(toParentViewController: self)
        pageViewController?.view.frame = pageViewContainer.frame
        pageViewContainer.addSubview(pageViewController!.view)
        pageViewContainer.bringSubview(toFront: pageControl)
        for subView in pageViewController!.view.subviews {
            if let scrollView = subView as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
