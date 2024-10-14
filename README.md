# FormSteward Example

This project demonstrates how to use **FormSteward** to create responsive multi-step forms in Flutter. The app dynamically loads form steps from a JSON configuration and adjusts the layout based on screen size (mobile, tablet, desktop).

## Features

- **Responsive Design**: Uses breakpoints for mobile, tablet, and desktop layouts.
- **Custom Stepper**: A custom `StepperWidget` for form transitions, validation, and submissions.
- **Dynamic Form Loading**: Form steps are loaded from a JSON file in `assets/form_config.json`.
- **Form Navigation**: Supports moving forward, backward, and submitting forms with data validation.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Dun-Njuguna/form_steward_example.git
   ```

2. Navigate to the project directory:
   ```bash
   cd form_steward_example
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## JSON Configuration

The form configuration is stored in `assets/form_config.json`. Modify this file to change the form steps.

## Code Overview

- `ScreenBreakpoints`: Defines the breakpoints for responsive design.
- `ResponsiveHelper`: Helper methods to check if the device is small, medium, or large.
- `MyCustomStepperWidget`: Custom stepper that handles form navigation and data passing between steps.
- `DynamicFormPage`: The main widget that loads and displays the form.

## License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.