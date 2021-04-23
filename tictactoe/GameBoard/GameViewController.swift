//
//  ViewController.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var buttonStartNewGame: UIButton! {
        didSet {
            buttonStartNewGame.setTitle("Recommencer partie", for: .normal)
            buttonStartNewGame.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            buttonStartNewGame.backgroundColor = .systemRed
            buttonStartNewGame.setTitleColor(.white, for: .normal)
            buttonStartNewGame.round()
        }
    }
    
    @IBOutlet weak var labelNextPlayer: UILabel! {
        didSet {
            labelNextPlayer.text = "Prochain joueur:"
            labelNextPlayer.textColor = .systemGray
        }
    }
    
    @IBOutlet weak var currentPlayerImageView: UIImageView!
    
    // Toplane
    @IBOutlet weak var imageViewTopLeft: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewTopLeft, with: .topLeft)
        }
    }
    @IBOutlet weak var imageViewTopMiddle: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewTopMiddle, with: .topMiddle)
        }
    }
    @IBOutlet weak var imageViewTopRight: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewTopRight, with: .topRight)
        }
    }
    
    // Midlane
    @IBOutlet weak var imageViewCenterLeft: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewCenterLeft, with: .centerLeft)
        }
    }
    @IBOutlet weak var imageViewCenter: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewCenter, with: .center)
        }
    }
    @IBOutlet weak var imageViewCenterRight: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewCenterRight, with: .centerRight)
        }
    }
    
    //Botlane
    @IBOutlet weak var imageViewBottomLeft: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewBottomLeft, with: .bottomLeft)
        }
    }
    @IBOutlet weak var imageViewBottomMiddle: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewBottomMiddle, with: .bottomMiddle)
        }
    }
    @IBOutlet weak var imageViewBottomRight: GameImageView! {
        didSet {
            self.initGameImage(imageView: imageViewBottomRight, with: .bottomRight)
        }
    }
    
    var viewModel: GameViewModel!
    var allImages: [GameImageView] {
        return [
            imageViewTopLeft, imageViewTopMiddle, imageViewTopRight,
            imageViewCenterLeft, imageViewCenter, imageViewCenterRight,
            imageViewBottomLeft, imageViewBottomMiddle, imageViewBottomRight
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = GameViewModel()
        self.view.backgroundColor = .systemGray6
        
        self.viewModel.currentPlayer.addAndNotify(observer: self) {
            self.currentPlayerImageView.image = self.viewModel.currentPlayer.value.getSymbol()
            self.currentPlayerImageView.tintColor = self.viewModel.currentPlayer.value.getColor()
        }
        
        self.viewModel.gameStatus.addAndNotify(observer: self) {
            let status = self.viewModel.gameStatus.value
            
            switch(status) {
            case .draw:
                self.showAlert(title: "Egalité", message: "Personne n'a gagné, retentez le coup !")
            case .winning(let player):
                self.showAlert(title: "Victoire !", message: "Le player \(player.localizedName()) a gagné ! Félicitation ! Une petite vengeance ?")
            case .inProgress, .unknown:
                break
            }
        }
        
    }
    
    private func initGameImage(imageView: GameImageView, with box: Box) {
        let gestureTapGameImage = UITapGestureRecognizer(target: self, action: #selector(tapGameImage(tapGestureRecognizer:)))
        
        imageView.set(with: box)
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gestureTapGameImage)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "C'est reparti !", style: .default, handler: { action in
            self.viewModel.reset()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func touchUpButtonStartNewGame(_ sender: Any) {
        self.reset()
    }
    
    private func reset() {
        self.viewModel.reset()
        self.allImages.forEach { $0.image = nil }
    }
    
    @objc func tapGameImage(tapGestureRecognizer: UITapGestureRecognizer) {
        if let tappedImage = tapGestureRecognizer.view as? GameImageView {
            do {
                let currentPlayer = self.viewModel.currentPlayer.value
                try self.viewModel.play(box: tappedImage.getBox())
                tappedImage.image = currentPlayer.getSymbol()
                tappedImage.tintColor = currentPlayer.getColor()
            } catch (let error) {
                print(error)
            }
        }
    }
}

