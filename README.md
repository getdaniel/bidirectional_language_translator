# Bidirectional-Language-Translator :repeat: :computer:
Bidirectional Language Translator Mobile Application with Flutter framework. The application as a flutter framework, is compatible with Android :iphone:, iOS :iphone:, Linux :desktop_computer:, Windows :window: and Browser(Web) :computer:. For the time of now it can only ability to translate the Ge'ez langauge to the Amharic language and vice versa.

<p align="center">
  <img src="https://github.com/getdaniel/bidirectional_language_translator/blob/main/assets/images/readme/flutter.png" alt="Flutter Icon">
  <img src="https://github.com/getdaniel/bidirectional_language_translator/blob/main/assets/images/readme/icon.png" alt="The project's Icon">
</p>

## About the Project :building_construction:
- The Bidirectional Language Translation Project aims to develop a tool that can translate text between Geez and Amharic, two closely related languages spoken in Ethiopia and Eritrea. The project aims to make translation between the two languages more accessible and convenient, particularly for people who may not be fluent in both languages.
- The project involves the development of a translation engine that uses natural language processing (NLP) techniques to analyze and understand the meaning of text in one language, and then generate equivalent text in the other language. The translation engine will be trained on a large dataset of text in both languages, in order to learn the patterns and rules of each language and improve the accuracy of the translations it generates.
- The Bidirectional Language Translation Project will benefit a wide range of users, including students, researchers, business professionals, and others who need to translate between Geez and Amharic for various purposes. It will also contribute to the preservation and promotion of these two important languages, by making them more accessible and widely used.

<p align="center">
  <img src="https://github.com/getdaniel/bidirectional_language_translator/blob/main/assets/images/readme/Diagram - UI.png" alt="The projects interface">
</p>

### Entire Project Description
- The folder that named [Android](https://github.com/getdaniel/bidirectional_language_translator/tree/main/android), [iOS](https://github.com/getdaniel/bidirectional_language_translator/tree/main/ios), [Linux](https://github.com/getdaniel/bidirectional_language_translator/tree/main/linux), [MacOS](https://github.com/getdaniel/bidirectional_language_translator/tree/main/macos), [Web](https://github.com/getdaniel/bidirectional_language_translator/tree/main/web), [Windows](https://github.com/getdaniel/bidirectional_language_translator/tree/main/windows) are about the configuration file path of the their respective platforms.

- [Docs](https://github.com/getdaniel/bidirectional_language_translator/tree/main/docs) and [Outs](https://github.com/getdaniel/bidirectional_language_translator/tree/main/out/docs) are the documentation folder of the project.

- [Test](https://github.com/getdaniel/bidirectional_language_translator/tree/main/test) folder is the folder of the test code should be prepared.

- [Lib](https://github.com/getdaniel/bidirectional_language_translator/tree/main/lib)/* is folder that the main functionality of the project is found on.

### Snippet Code
- The below code is the main algorithm that used now.
```
// the textfield's controllers
  final textController = TextEditingController();
  final outputController = TextEditingController();

  final _classifier = Classifier();

  // Initial Selected Value
  String dropdownvalue = "Ge'ez to Amharic";

  // List of items in our dropdown menu
  var items = ["Ge'ez to Amharic", "Amharic to Ge'ez"];

  @override
  void initState() {
    super.initState();
    textController.addListener(translate);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    textController.dispose();
    super.dispose();
  }

  // Fetch content from the json file
  Future<void> translate() async {
    final String response =
        await rootBundle.loadString('assets/files/geez_amharic.json');
    Map lang = await json.decode(response);

    String inputText = textController.text;
    String outputText = '';

    if (dropdownvalue == "Ge'ez to Amharic") {
      if (lang.containsKey(inputText)) {
        outputText = lang[inputText];
      } else {
        outputText = _classifier.classify(inputText);
      }
    } else {
      lang.forEach((key, value) {
        if (value == inputText) {
          outputText = key;
        }
      });
      if (outputText.isEmpty) {
        outputText = _classifier.classify(inputText);
      }
    }

    setState(() {
      outputController.text = outputText;
    });
  }
```

- The following code is the AI model inference method
```
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
```

### Installation :arrow_down:
- Install your favorite app from their repective app stores

## Usage :running_man: :running_woman:
### Step :one:
`Choose a favorite language to translate a text.`

### Step :two:
`Enter a corresponding text to the first text field`

### Step :three:
`The text will be appear at the text field of the app.`

### Testing
<p align="center">
  <video src="https://github.com/getdaniel/bidirectional_language_translator/blob/main/assets/images/readme/test_1.mp4" alt="Tested output"><video>
</p>

## Contributing :handshake:
If you are interesting on this project, contact us through the below mail contact to contribute for the project.
* **DANIEL GETANEH** <[GMail](mailto:danielgetaneh2011@gmail.com)>
* **YEZIBALEM AEMRO** <[GMail](mailto:yezbaemiro@gmail.com)>
* **YEABSIRA AYCHILUHM** <[GMail](mailto:yeabsiraaychiluhim@gmail.com)>

## Authors :man_technologist: :woman_technologist: :ethiopia:
 * **DANIEL GETANEH** <[getdaniel](https://www.github.com/getdaniel)> 
 * **YEZIBALEM AEMRO** <[yeziba](https://www.github.com/yeziba)> 
 * **YEABSIRA AYCHILUHM** <[Asimarech](https://www.github.com/Asimarech)> 

## LICENSE :1st_place_medal:
Distributted Under the MIT License. See the [LICENCE](https://github.com/getdaniel/simple_language_translator/blob/main/LICENSE)
