let sentence = "The movie is not that bad, I like it";
let wordNot = sentence.indexOf("not");
let wordBad = sentence.indexOf("bad");

if (wordNot !== -1 && wordBad !== -1 && wordBad > wordNot) {
  let beforeNot = sentence.slice(0, wordNot);
  let afterBad = sentence.slice(wordBad + 3);
  let newSentence = beforeNot + "good" + afterBad;
  console.log(newSentence);
} else {
  console.log(sentence);
}
