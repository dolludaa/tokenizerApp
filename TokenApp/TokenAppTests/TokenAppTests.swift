//
//  TokenAppTests.swift
//  TokenAppTests
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import XCTest
@testable import TokenApp

final class TokenAppTests: XCTestCase {

  let tokenizer = Tokenizer()

  func testTokenizeEnglishWithAnd() throws {
    let text = "Hello and welcome to the test"
    let expected = ["Hello", "and welcome to the test"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expected, "The text should be split correctly by 'and' in English.")
  }

  func testTokenizeEnglishWithIf() throws {
    let text = "What if we try this test"
    let expected = ["What", "if we try this test"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expected, "The text should be split correctly by 'if' in English.")
  }

  func testTokenizeSpanishWithSi() throws {
    let text = "Qué si vamos a probar esto"
    let expected = ["Qué", "si vamos a probar esto"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .spanish), expected, "The text should be split correctly by 'si' in Spanish.")
  }

  func testTokenizeSpanishWithY() throws {
    let text = "Esto y aquello son importantes"
    let expected = ["Esto", "y aquello son importantes"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .spanish), expected, "The text should be split correctly by 'y' in Spanish.")
  }

  func testTokenizeWithoutKeywords() throws {
    let text = "This is a test"
    let expected = [text].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expected, "The text should not be split when no keywords are present.")
  }

  func testPerformanceTokenize() throws {
    let text = "This is a performance test and it should be fast"
    measure {
      _ = tokenizer.tokenize(text: text, language: .english)
    }
  }

  func testTokenizeWithMixedLanguages() throws {
    let text = "Hello and hola y goodbye"
    let expectedEnglish = ["Hello", "and hola y goodbye"].joined(separator: "\n")
    let expectedSpanish = ["Hello and hola", "y goodbye"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expectedEnglish, "The text should be split correctly with mixed languages using English keywords.")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .spanish), expectedSpanish, "The text should be split correctly with mixed languages using Spanish keywords.")
  }

  func testTokenizeWithMultipleAndIfInEnglish() throws {
    let text = "This and that if or when and how"
    let expected = ["This", "and that", "if or when", "and how"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expected, "The text should be split correctly by multiple 'and' and 'if' in English.")
  }

  func testTokenizeWithMultipleSiYInSpanish() throws {
    let text = "Si esto y aquello entonces si o no y tal vez"
    let expected = ["Si esto", "y aquello entonces", "si o no", "y tal vez"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .spanish), expected, "The text should be split correctly by multiple 'si' and 'y' in Spanish.")
  }

  func testTokenizeWithPunctuationInEnglish() throws {
    let text = "Hello, and how are you? If you're good, that's great!"
    let expected = ["Hello,", "and how are you?", "If you're good, that's great!"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .english), expected, "The text should be split correctly with punctuation in English.")
  }

  func testTokenizeWithPunctuationInSpanish() throws {
    let text = "Hola, y cómo estás? Si estás bien, eso es genial!"
    let expected = ["Hola,", "y cómo estás?", "Si estás bien, eso es genial!"].joined(separator: "\n")
    XCTAssertEqual(tokenizer.tokenize(text: text, language: .spanish), expected, "The text should be split correctly with punctuation in Spanish.")
  }

}
