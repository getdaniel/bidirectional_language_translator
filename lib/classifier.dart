import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  Interpreter? _interpreter;
  late List<String> _vocab;

  Classifier() {
    _loadModel();
    _loadDictionary();
  }

  void _loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset('files/translate.tflite');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  void _loadDictionary() async {
    final vocab = await rootBundle.loadString('assets/files/geez_amharic.txt');
    _vocab = vocab.trim().split('\n');
  }

  String classify(String rawText) {
    // Tokenize input text
    final tokens = rawText.split(' ');

    // Convert tokens to numerical input
    final List<num> input = List.filled(_vocab.length * 2, 0);
    for (int i = 0; i < tokens.length; i++) {
      final index = _vocab.indexOf(tokens[i]);
      if (index >= 0) {
        input[i] = index.toDouble();
        input[_vocab.length + i] = index.toDouble();
      }
    }

    // Run inference
    final output = List.filled(_vocab.length * 2, 0);
    _interpreter?.run(input, output);

    // Convert numerical output to tokens
    final List<String> outputTokens = [];
    for (int i = 0; i < tokens.length; i++) {
      final index = output.indexOf(output[i + _vocab.length]);
      if (index >= 0 && index < _vocab.length) {
        outputTokens.add(_vocab[index]);
      }
    }

    // Join tokens into string and return
    final outputText = outputTokens.join(' ');
    return outputText;
  }
}
