import Vapor
import XCTest

@testable import AsyncCommandRegister

final class test: XCTestCase {
  func testRegister() throws {
    let app = Vapor.Application(.testing)
    struct HelloAsyncCommand: AsyncCommand {
      struct Signature: CommandSignature {}
      var help: String { "Says hello" }
      func run(using context: CommandContext, signature: Signature) async throws {
        context.console.print("Hello, world!")
      }
    }

    app.commands.use(HelloAsyncCommand(), as: "hello")
  }
}
