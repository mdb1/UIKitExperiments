//: A UIKit based Playground for presenting user interface
  
import UIKit
import CoreUI
import PlaygroundSupport

class MyViewController : UIViewController {
    private lazy var button: MainButton = MainButton()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        button.setTitle("Tap me", for: .normal)
        button.addAction(.init(handler: { _ in
            self.button.setEnabled(false)
        }), for: .touchUpInside)

        view.addSubview(button, constrainedBy: [.bottom: .medium, .leading: .medium, .trailing: .medium])

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))

        view.randomizeColors()
        self.view = view
    }

    @objc func didTapView() {
        button.setEnabled(true)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
