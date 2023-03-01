import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {

  // Maximum length of sentence
  final int _sentenceLen = 40;

  final String start = '<START>';
  final String pad = '<PAD>';

  late Map<String, int> _dict;

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  Classifier() {
    // Load model when the classifier is initialized.
    _loadModel();
    _loadDictionary();
  }

  void _loadModel() async {
    // Creating the interpreter using Interpreter.fromAsset
    _interpreter = await Interpreter.fromAsset('files/translate.tflite');
  }

  void _loadDictionary() async {
    final vocab = await rootBundle.loadString('assets/files/geez_amharic.txt');
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split('\t');
      dict[entry[0]] = int.parse(entry[1]);
    }
    _dict = dict;
  }

  String classify(String rawText) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 40].
    List<List<double>> input = tokenizeInputText(rawText);

    // output of shape [1,1].
    var output = List<double>.filled(1, 0).reshape([1, 1]);

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output);

    return indexToWord(output[0][0].round());
  }

  List<List<double>> tokenizeInputText(String text) {
    // Whitespace tokenization
    final toks = text.split(' ');

    // Create a list of length==_sentenceLen filled with the value <pad>
    var vec = List<double>.filled(_sentenceLen, _dict[pad]!.toDouble());

    var index = 0;

    // Add start token at the beginning of the sentence
    if (_dict.containsKey(start)) {
      vec[index++] = _dict[start]!.toDouble();
    }

    // For each word in sentence find corresponding index in dict
    for (var tok in toks) {
      if (index >= _sentenceLen - 1) {
        break;
      }
      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok]!.toDouble()
          : _dict[pad]!.toDouble();
    }

    // Add end token at the end of the sentence
    if (_dict.containsKey('<END>')) {
      vec[index++] = _dict['<END>']!.toDouble();
    }

    // returning List<List<double>> as our interpreter input tensor expects the shape, [1,40]
    return [vec];
  }

  String indexToWord(int index) {
    for (var entry in _dict.entries) {
      if (entry.value == index) {
        return entry.key;
      }
    }
    return '<UNKNOWN>';
  }
}
