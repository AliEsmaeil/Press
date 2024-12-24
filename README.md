![app-icon.png](assets%2Fimages%2Fapp-icon.png)

# Press
Press is a mobile application that measure user gesture accurately and collect a data set as a final result to be applied for ML models.

**Table of Contents**
- Features and usage
- Measured Gestures
- Technologies used
- File Hierarchy
- How it looks
- Code Extraction
_____________________________________________________________
### Feature and usage
**Drag Drop Question**, press measures gesture through observing user touches during interacting with questions.
**Statistics Graphs**, presenting the average of every gesture on a statistical graph to show up how data is.
**Data Set** provide the data set collected from done tests within a good formatted excel sheet to be applied to ML models.
**Provide Flavors** as a normal user you can answer the questions and explore a limited version of results, admins only can get into statistical part of the application.

###Measured Gestures
-- Drag Angel
-- Touch Pressure
-- Touch Count(relatively to time)
-- Touch Frequency
-- Swipe Speed
-- Time Between Touches
-- Distance Between Touches

### Technologies used
- Dart
- Flutter
- Firebase(BaaS)
- LocalStorage
- - Secure Storage(encrypted version of key-value based DBs)
- Bloc(Cubit)
- Google Maps
- Statistical Charts (syncfusion)

### File Hierarchy
.
└── lib/
├── core/
│   ├── extensions
│   ├── internet_connectivity
│   ├── reusable_widgets
│   ├── router
│   ├── url_laucher
│   ├── utils
│   └── validators
├── features/
│   ├── about_screen
│   ├── home/
│   │   ├── data
│   │   ├── managers
│   │   ├── view
│   │   └── widgets
│   ├── local_storage
│   ├── statistics_screen/
│   │   ├── managers
│   │   ├── view
│   │   └── widgets
│   ├── test_screen
│   ├── managers
│   ├── view/
│   │   └── dragging_game
│   └── widgets
├── models
└── splash_screen

### How it Looks
![1.png](screenshots%2F1.png)
![2.png](screenshots%2F2.png)
![3.png](screenshots%2F3.png)
![4.png](screenshots%2F4.png)

you could see screenshots singularly, just go to [screenshots](screenshots) dir.

>For more, watch the following video that demonstrate a walkthrough features of *Press*:
>
>[Video Preview](https://www.youtube.com/watch?v=3w-a3zHYzhw)

### Code Extraction
While this repository is licensed under the Apache License 2.0, we would like to highlight the following important points:

- Code Extraction: Please refrain from extracting code from this repository for use in other projects. The code is provided for the purposes of learning, experimentation, and contribution to this project only.

- Respect the License: Ensure that any use of the code complies with the terms of the Apache License 2.0. The license permits use, modification, and distribution, but does not allow for code extraction for patent-related claims.

Last, but not least this repo is welcoming contribution so, feel free to open a pull request.


