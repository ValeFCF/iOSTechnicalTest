//
//  DetailViewController.swift
//  iOSTechnicalTest
//
//  Created by Emmanuel Valentín Granados López on 5/19/19.
//  Copyright © 2019 Emmanuel Valentín Granados López. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLenguage: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    
    var contentDetail: [String : AnyObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        let backdrop = contentDetail["backdrop_path"] as! String
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(backdrop)") {
            imgContent.load(url: url)
        }
        
        lblTitle.text = contentDetail["original_title"] as? String
        lblLenguage.text = (contentDetail["original_language"] as? String)?.uppercased()
        lblOverview.text = contentDetail["overview"] as? String
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
