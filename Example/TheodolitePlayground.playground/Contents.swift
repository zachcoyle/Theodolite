import UIKit
import PlaygroundSupport

import Theodolite

final class TestComponent: TypedComponent {
  typealias PropType = Void?
  
  func render() -> [Component] {
    return [
      ScrollComponent {
        (FlexboxComponent {
          (options: FlexOptions(
            flexDirection: .column
            ),
           children:
            Array(repeating: "Hello World", count: 100)
              .map {(str: String) -> FlexChild in
                return FlexChild(
                  LabelComponent {
                    (str,
                     LabelComponent.Options())
                })
          })
          },
         direction: .vertical,
         attributes: [])
      }
    ]
  }
}

class MyViewController : UIViewController {
  override func loadView() {
    let hostingView = ComponentHostingView { () -> Component in
      return TestComponent {nil}
    }
    hostingView.backgroundColor = .white
    
    self.view = hostingView
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
