//
//  ViewController.swift
//  Gorjetaria
//
//  Created by Guilherme Golfetto on 20/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtValorConta : UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var dezPctButton: UIButton!
    
    @IBOutlet weak var vintePctButton: UIButton!
    
    @IBOutlet weak var qtdPessoasLabel: UILabel!
    
    var gorjeta = 0.10
    var numeroDePessoas = 2
    var totalConta = 0.0
    var resultadoFinal = "0.0"
   
    
    @IBAction func addGorjeta(_ sender: UIButton) {
        txtValorConta.endEditing(true)
        
        zeroPctButton.isSelected = false
        dezPctButton.isSelected = false
        vintePctButton.isSelected = false
        
        sender.isSelected = true
        
        let titulo = sender.currentTitle!
        let somenteAQtd = String(titulo.dropLast()) //para remover o sinal de % do fim do texto
        let qtd = Double(somenteAQtd)!
        gorjeta = qtd / 100
    }
    
    @IBAction func addPessoa(_ sender: UIStepper) {
        qtdPessoasLabel.text = String(format: "%.0f", sender.value)
        numeroDePessoas = Int(sender.value)
    }
    
    @IBAction func calcular(_ sender: UIButton) {
        
        let conta = txtValorConta.text!
        if conta != ""{
            totalConta = converterParaDouble(conta)
            let resultado = totalConta * (1 + gorjeta) / Double(numeroDePessoas)
            resultadoFinal = String(format: "R$ %.2f", resultado)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! ResultsController
        destino.totalConta = resultadoFinal
        destino.complemento = "Divido em \(numeroDePessoas) pessoas, com \(Int(gorjeta * 100))% de gorjeta."
    }
    
    func converterParaDouble(_ valor : String) -> Double {
        let formatador = NumberFormatter()
        formatador.locale = Locale.current
        formatador.numberStyle = .decimal
        let numero = formatador.number(from: valor)
        return numero!.doubleValue
    }
}

