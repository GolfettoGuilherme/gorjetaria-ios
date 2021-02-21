//
//  ResultsController.swift
//  Gorjetaria
//
//  Created by Guilherme Golfetto on 20/02/21.
//

import UIKit

class ResultsController: UIViewController {

    @IBOutlet weak var txtTotalPessoa: UILabel!
    @IBOutlet weak var txtComplemento: UILabel!
    
    var totalConta = ""
    var complemento = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTotalPessoa.text = totalConta
        txtComplemento.text = complemento
    }
    

    @IBAction func btnVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
