import Vapor

extension Commands {
  public mutating func use(_ command: some AsyncCommand, as name: String, isDefault: Bool = false) {
    self.use(AsyncToCommand(command: command), as: name, isDefault: isDefault)
  }
}

private final class AsyncToCommand<AC: AsyncCommand>: Command, Sendable {
  let command: AC

  init(command: AC) {
    self.command = command
  }

  typealias Signature = AC.Signature

  var help: String { command.help }

  public func run(using context: ConsoleKit.CommandContext, signature: Signature) throws {
    let promise = context
      .application
      .eventLoopGroup
      .next()
      .makePromise(of: Void.self)

    promise.completeWithTask {
      try await self.command.run(
        using: context,
        signature: signature
      )
    }
    try promise.futureResult.wait()
  }
}
