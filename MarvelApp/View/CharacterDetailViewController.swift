import UIKit
import SDWebImage

class CharacterDetailViewController: UIViewController {
    
    var character: Character?
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mostrar la información del personaje si está disponible
        if let character = character {
            nameLabel.text = character.name
            descriptionLabel.text = character.description
            
            // Configurar la miniatura del personaje
            if let url = URL(string: character.thumbnail.url) {
                characterImageView.sd_setImage(with: url)
            }
            
            // Configurar el botón para abrir la URL del personaje si está disponible
            if let url = URL(string: character.urls.first?.url ?? "") {
                urlButton.setTitle("More Info", for: .normal)
                urlButton.addTarget(self, action: #selector(openURL), for: .touchUpInside)
            } else {
                urlButton.isHidden = true
            }
        }
    }
    
    @objc func openURL() {
        // Abrir la URL del personaje en un navegador web
        if let character = character, let url = URL(string: character.urls.first?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

