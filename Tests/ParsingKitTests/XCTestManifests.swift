import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ParsingKitTests.allTests),
        testCase(SpacesAndNewLinesTest.allTests)
    ]
}
#endif
