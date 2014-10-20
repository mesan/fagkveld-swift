//
//  ViewController.swift
//  iweather
//
//  Created by Anders Ullnæss on 20/10/14.
//  Copyright (c) 2014 Mesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Oppgave 1
        let name = "Taylor Swift"
        nameLabel.text = "Hello, \(name)!"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

