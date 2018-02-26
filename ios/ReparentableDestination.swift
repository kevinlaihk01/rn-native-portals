import UIKit

class ReparentableDestination: UIView, ReparentableView {
  
  var registry: ReparentableRegistry
  var lastOrigin: ReparentableOrigin?
  
  @objc var name: NSString {
    didSet {
      registry.put(destination: self)
      moveIfNeeded()
    }
  }
  
  func moveIfNeeded() {
    guard let potentialOrigin = registry.get(destinationName: name) else { return }
    potentialOrigin.moveTo(destination: self)
    prepareNextRestitute(origin: potentialOrigin)
  }
  
  func restitute()  {
    guard let lastOrigin = self.lastOrigin else { return }
    moveTo(destination: lastOrigin)
    lastOrigin.lastDestination = nil
    self.lastOrigin = nil
  }
  
  func prepareNextRestitute(origin: ReparentableOrigin) {
    lastOrigin = origin
    origin.lastDestination = self
  }
  
  init(registry: ReparentableRegistry) {
    self.registry = registry
    name = ""
    lastOrigin = nil
    super.init(frame: CGRect.zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
