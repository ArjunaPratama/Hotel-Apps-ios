//
//  ViewController.swift
//  Hotel Apps iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labellokasi: UILabel!
    @IBOutlet weak var labelasilitas: UILabel!
    @IBOutlet weak var labelrate: UILabel!
    @IBOutlet weak var labelalamat: UILabel!
    @IBOutlet weak var labelnama: UILabel!
    var passnama:String?
    var passalamat:String?
    var passfasilitas:String?
    var passlokasi:String?
    var passrate:String?
    override func viewDidLoad() {
        labelnama.text = passnama!
        labelalamat.text = passalamat!
        labelrate.text = passrate!
        labelasilitas.text = passfasilitas!
        labellokasi.text = passlokasi!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

