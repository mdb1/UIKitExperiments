import UIKit
import CoreUI

public class MainButton: UIButton {
    public init() {
        super.init(frame: .zero)
        setUpView()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setEnabled(_ enabled: Bool) {
        if enabled {
            enableAnimated()
        } else {
            disableAnimated()
        }
    }
}

private extension MainButton {
    enum Constants {
        static let height: CGFloat = 60
        static let cornerRadius: CGFloat = 20
        static let animationDuration: CGFloat = 0.25
        static let enabledBackgroundColor = UIColor.blue
        static let disabledColor = UIColor.lightGray
    }

    func setUpView() {
        pin(height: Constants.height)
        cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.enabledBackgroundColor
        isEnabled = true
    }

    func enableAnimated() {
        guard !isEnabled else { return }
        isEnabled = true
        UIView.transition(
            with: self,
            duration: Constants.animationDuration)
        {
            self.layer.backgroundColor = Constants.enabledBackgroundColor.cgColor
        }
    }

    func disableAnimated() {
        guard isEnabled else { return }
        isEnabled = false
        UIView.animate(withDuration: Constants.animationDuration) {
            self.layer.backgroundColor = Constants.disabledColor.cgColor
        }
    }
}
