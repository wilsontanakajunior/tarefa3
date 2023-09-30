//
//  ViewController.swift
//  cuidandoDoBairro
//
//  Created by Wilson Tanaka Pereira dos reis junior on 30/09/23.
//

import UIKit

class DenunciaViewController: UIViewController {
    var denuncia: Denuncia?
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var labelLocalizacao: UILabel!
    @IBOutlet weak var imageViewDenuncia: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let denunciaFormViewController = segue.destination as? DenunciaFormViewController{
            denunciaFormViewController.denuncia = denuncia
        }
    }
    func prepareScreen(){
        if let denuncia = denuncia {
            print(denuncia)
            if let foto = denuncia.foto {
                imageViewDenuncia.image = UIImage(data: foto)
            }
            labelNome.text = denuncia.nome
            textViewDescricao.text = denuncia.descricao
            labelLocalizacao.text = denuncia.localizacao
          
        }
    }
}

