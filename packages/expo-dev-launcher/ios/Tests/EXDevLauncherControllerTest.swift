import Quick
import Nimble

@testable import EXDevLauncher

class EXDevLauncherControllerTest: QuickSpec {
  override func spec() {
    it("should return correct version") {
      let version = EXDevLauncherController.version()

      expect(version).toNot(beNil())
    }

    it("sharedInstance should always return the same instance") {
      let sharedInstance = EXDevLauncherController.sharedInstance()

      expect(sharedInstance).toNot(beNil())
      expect(sharedInstance).to(be(EXDevLauncherController.sharedInstance()))
    }

    it("extraModulesForBridge should return essential modules") {
      let module = EXDevLauncherController.sharedInstance()

      let modules = module.extraModules(for: nil)!

      expect(modules.first { $0 is RCTDevMenu }).toNot(beNil())
      expect(modules.first { type(of: $0).moduleName() == "DevLoadingView" }).toNot(beNil())
    }

    it("controller should have access to managers classes") {
      let module = EXDevLauncherController.sharedInstance()

      expect(module.errorManager()).toNot(beNil())
      expect(module.pendingDeepLinkRegistry).toNot(beNil())
    }
  }
}
