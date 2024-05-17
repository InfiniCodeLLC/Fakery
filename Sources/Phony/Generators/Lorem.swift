import Foundation

public extension Phony {
    final class Lorem: Generator {
        public func word() -> String {
            return data.loremWords.random() ?? ""
        }

        public func words(amount: Int = 3) -> String {
            var words: [String] = []

            for _ in 0..<amount {
                words.append(self.word())
            }

            return words.joined(separator: " ")
        }

        public func character() -> String {
            return self.characters(amount: 1)
        }

        public func characters(amount: Int = 255) -> String {
            return String.characters(amount: amount)
        }

        public func sentence(wordsAmount: Int = 4) -> String {
            var sentence = self.words(amount: wordsAmount) + "."
            sentence.replaceSubrange(
                sentence.startIndex...sentence.startIndex,
                with: String(sentence[sentence.startIndex]).capitalized
            )
            return sentence
        }

        public func sentences(amount: Int = 3) -> String {
            var sentences: [String] = []

            for _ in 0..<amount {
                sentences.append(self.sentence())
            }

            return sentences.joined(separator: " ")
        }

        public func paragraph(sentencesAmount: Int = 3) -> String {
            return self.sentences(amount: sentencesAmount)
        }

        public func paragraphs(amount: Int = 3) -> String {
            var paragraphs: [String] = []

            for _ in 0..<amount {
                paragraphs.append(self.paragraph())
            }

            return paragraphs.joined(separator: "\n")
        }
    }
}
