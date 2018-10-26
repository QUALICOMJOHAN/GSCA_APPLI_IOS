import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GSCA_APPLI_IOSTests.allTests),
    ]
}
#endif