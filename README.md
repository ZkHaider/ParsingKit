#  ParsingKit

Create custom parsers to extract types from `String` types.

## Installation 

### Carthage 

Add `github "ZkHaider/ParsingKit" "master"` to your Cartfile, and run Carthage. 

### Requirements

- Deployment target iOS 10.0+
- Swift 4+
- Xcode 10+

## Parser Type 

Our base unit for this framework is the `Parser` it has a run function which takes a `Substring` due to performance benefits and parses a generic type `T`.

```swift 
public struct Parser<T> {
    let run: (inout Substring) -> T?
}
```

This library has some built in `Parser`s that already handle parsing of certain `Character`s such as:

- `Float`
- `Double`
- `Character`
- `CGPoint`
- `CGRect` 
- `CGSize`
- `{` or  `}`
- `[` or  `]`
- `(` or  `)`
- One or more spaces 
- Zero or more spaces

## Create your own

You can create your own `Parser` by extending it as so:

```swift
// Example string to parser:
// "{2.0}"

struct MyCustomStruct {
    let someFloat: Float
}

extension Parser where T == MyCustomStruct {

    public static let myCustomStructParser: Parser<T> = {
        return zip(
            .leftCurlyBrace,
            .float,
            .rightCurlyBrace
        ).map { _, float, _ in 
            return MyCustomStruct(someFloat: float)
        }
    }()

}

let stringToParse: String = "{2.0"
let parser = Parser.myCustomStructParser
parser.run(stringToParse)

// Output: (match: Float(2.0), rest: nil)
```
