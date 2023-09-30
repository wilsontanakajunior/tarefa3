//
//  DenunciaTableViewCell.swift
//  cuidandoDoBairro
//
//  Created by Wilson Tanaka Pereira dos reis junior on 30/09/23.
//

import UIKit

class DenunciaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewDenuncia: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelLocalizacao: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureWith(_ denuncia: Denuncia){
        labelNome.text = denuncia.nome
        labelLocalizacao.text = denuncia.localizacao
        
        if let image = denuncia.foto {
            imageViewDenuncia.image = UIImage(data: image)
        }
    }
}
