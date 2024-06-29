# TipSplitter

TipSplitter is an iOS application designed to help users quickly calculate how much each person should pay after a meal, including the tip. This utility app provides a simple and intuitive user interface for entering the total bill amount, selecting a tip percentage, and specifying the number of people splitting the bill.

## Features

- **Dynamic tip calculation**: Automatically updates the total per person and total bill including tip as you input values.
- **Customizable tip percentages**: Choose from common percentages or enter a custom tip amount.
- **Split flexibility**: Easily increase or decrease the number of people splitting the bill.
- **Interactive UI**: Double-tap the logo to reset all inputs.

## Installation

To run TipSplitter, clone this repository and open it in Xcode.

```bash
git clone https://github.com/yourusername/TipSplitter.git
cd TipSplitter
open TipSplitter.xcodeproj
```

Ensure you have Xcode installed to build and run the app on your iOS device or simulator.

## Usage

To use the app, start by entering the total bill amount, then select or enter the desired tip percentage, and finally adjust the number of people splitting the bill. The calculated amount per person, total bill, and total tip are displayed dynamically as you adjust the inputs.

## Architecture

The app utilizes the MVVM (Model-View-ViewModel) design pattern, ensuring clean separation of business logic and user interface components. 

- **View**: Handles the UI components.
- **View Model**: Processes the business logic and state management.
- **Model**: Represents the data structures used by the app.

## Technologies

- **UIKit** for the user interface components.
- **Combine** for reactive programming, making the UI dynamic and responsive.
- **SnapKit** for simplified constraints and layout.

## Testing

The application includes both unit and UI tests to ensure functionality:

- **Unit Tests**: Test the calculation logic and ViewModel.
- **Snapshot Tests**: Visual regression tests for UI components.
- **UI Tests**: Automated tests simulating user interaction with the app.

To run the tests, select the `TipSplitterTests` or `TipSplitterUITests` scheme in Xcode and press `Command + U`.

## Contributions

Contributions are welcome! Please fork the repository and submit pull requests with any enhancements, bug fixes, or improvements you have made.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Giovanna Moeller - [@Linkedin](https://linkedin.com/in/giovannamoeller) - contact@giovannamoeller.com <br/>
Project Link: [https://github.com/giovannamoeller/tip-splitter](https://github.com/giovannamoeller/tip-splitter)
