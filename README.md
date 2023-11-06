# AsyncCommandRegister

![LICENSE](https://img.shields.io/badge/license-MIT-brightgreen.svg)

`AsyncCommandRegister` is a Swift package that enables easy registration of asynchronous commands within the Vapor framework. This library extends the functionality of Vapor's command-line interface, allowing you to register and use `AsyncCommand` in the same way as you would with a standard `Command`.

## Installation

Add `AsyncCommandRegister` to your project by inserting the following lines to your `Package.swift` file:

```swift
dependencies: [
    // Other dependencies...
    .package(url: "https://github.com/lemo-nade-room/swift-vapor-async-command-register.git", from: "0.0.1")
],
targets: [
    .target(
        name: "App",
        dependencies: [
            // Other dependencies...
            .product(name: "AsyncCommandRegister", package: "swift-vapor-async-command-register"),
        ]),
    // Test targets...
]
```

## Usage

After installing the package, you can import `AsyncCommandRegister` in your code:

```swift
import AsyncCommandRegister
```

Then, you can register your `AsyncCommand` with your Vapor application:

```swift
app.commands.use(YourAsyncCommand(), as: "command-name")
```

Here's an example of an asynchronous command:

```swift
import Vapor
import AsyncCommandRegister

struct HelloAsyncCommand: AsyncCommand {
    struct Signature: CommandSignature {}
    var help: String { "Says hello asynchronously" }
    
    func run(using context: CommandContext, signature: Signature) async throws {
        context.console.print("Hello, world, asynchronously!")
    }
}

// Register the command with the Vapor app
app.commands.use(HelloAsyncCommand(), as: "hello")
```

## License

`AsyncCommandRegister` is released under the MIT license. See LICENSE for details.