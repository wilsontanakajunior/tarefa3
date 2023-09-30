//
//  DenunciaFormViewController.swift
//  cuidandoDoBairro
//
//  Created by Wilson Tanaka Pereira dos reis junior on 30/09/23.
//

import UIKit


class DenunciaFormViewController: UIViewController {
    
    @IBOutlet weak var buttonAddEdit: UIButton!
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var textFieldLocalizacao: UITextField!
    @IBOutlet weak var imageViewDenuncia: UIImageView!
    
    var denuncia: Denuncia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let denuncia = denuncia {
            title = "Edição"
            textFieldNome.text = denuncia.nome
            textViewDescricao.text = denuncia.descricao
            textFieldLocalizacao.text = denuncia.localizacao
            
            if let image = denuncia.foto{
                imageViewDenuncia.image = UIImage(data: image)
            }
            buttonAddEdit.setTitle("Alterar", for: .normal)
        }
    }
    
    @IBAction func selectFoto(_ sender: Any) {
        let alert = UIAlertController(title: "Selecionar foto", message: "De onde você deseja escolher a foto", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style:.cancel, handler: nil)
        alert.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) {_ in
                self.selectPicker(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Biblioteca", style: .default) {_ in
            self.selectPicker(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        let albumAction = UIAlertAction(title: "Álbum de fotos", style: .default) {_ in
            self.selectPicker(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        
        present(alert, animated: true, completion: nil)
    }
    func selectPicker(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if denuncia == nil {
            denuncia = Denuncia(context: context)
        }
        
        denuncia?.nome = textFieldNome.text
        denuncia?.descricao = textViewDescricao.text
        denuncia?.localizacao = textFieldLocalizacao.text
        denuncia?.foto = imageViewDenuncia.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension DenunciaFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageViewDenuncia.image = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
