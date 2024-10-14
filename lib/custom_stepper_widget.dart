import 'package:flutter/material.dart';
import 'package:form_steward/form_steward.dart';

/// Defines breakpoints for responsive layout.
///
/// The breakpoints are categorized into three types:
/// - [small]: Mobile screen sizes
/// - [medium]: Tablet screen sizes
/// - [large]: Desktop screen sizes
class ScreenBreakpoints {
  static const double small = 600;   
  static const double medium = 1024; 
  static const double large = 1440;  
}

/// A utility class to help determine the screen size for responsive layout.
class ResponsiveHelper {
  
  /// Returns true if the current screen width is considered small (mobile).
  ///
  /// A small screen has a width less than [ScreenBreakpoints.small].
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < ScreenBreakpoints.small;
  }

  /// Returns true if the current screen width is considered medium (tablet).
  ///
  /// A medium screen has a width between [ScreenBreakpoints.small] 
  /// and [ScreenBreakpoints.medium].
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= ScreenBreakpoints.small &&
           MediaQuery.of(context).size.width < ScreenBreakpoints.medium;
  }

  /// Returns true if the current screen width is considered large (desktop).
  ///
  /// A large screen has a width equal to or greater than [ScreenBreakpoints.medium].
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= ScreenBreakpoints.medium;
  }
}

/// A custom Stepper widget that integrates with FormSteward.
///
/// This widget manages form transitions, validation, and data handling
/// based on the provided form steps and state notifiers.
class MyCustomStepperWidget extends StepperWidget {
  
  /// Creates a custom stepper widget.
  ///
  /// The [currentStep], [stepperType], [formStewardNotifier],
  /// [formStewardStateNotifier], and [formSteps] parameters are required.
  MyCustomStepperWidget({
    super.key,
    required super.currentStep,
    required super.stepperType,
    required super.formStewardNotifier,
    required super.formStewardStateNotifier, 
    required super.formSteps,
  });

  /// Called when moving to the next step.
  ///
  /// The [previousStepData] is a map of data collected in the previous step.
  /// This method prints key-value pairs from the previous step's data if available.
  @override
  void onNextStep({required Map<String, dynamic>? previousStepData}) {
    if (previousStepData != null) {
      // Iterate through the map and print key-value pairs
      previousStepData.forEach((key, value) {
        print('Key: $key, Value: $value');
      });
    } else {
      print('No data from the previous step.');
    }

    // Continue with the rest of your logic for moving to the next step
  }

  /// Custom implementation for handling the previous step.
  @override
  void onPreviousStep() {
    // Custom implementation for the previous step
  }

  /// Called when the form is submitted.
  ///
  /// The [formData] parameter contains the data for all form steps.
  @override
  void onSubmit({required Map<String, Map<String, dynamic>> formData}) {
    print("form data.....  ${formData.entries}");
    // Custom implementation for submission
  }
}

/// The main widget representing the dynamic form page.
///
/// This widget loads the form configuration from a JSON file and
/// displays the form using the [MyCustomStepperWidget].
class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({super.key});

  @override
  DynamicFormPageState createState() => DynamicFormPageState();
}

class DynamicFormPageState extends State<DynamicFormPage> {
  List<FormStepModel>? _formSteps;
  late StepController _stepController;
  late StewardStepperType stepperType;

  @override
  void initState() {
    super.initState();
    _stepController = StepController();
    _loadForm();
  }

  /// Loads the form configuration from a local JSON file.
  ///
  /// This method fetches the JSON file from the assets folder and
  /// initializes the form steps based on the file's contents.
  void _loadForm() async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/form_config.json');
    setState(() {
      _formSteps = FormService().loadFormFromJson(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    stepperType = _getFormType();

    if (_formSteps == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    final validationTriggerNotifier = ValidationTriggerNotifier();
    final formStewardStateNotifier = FormStewardStateNotifier();
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: _formSteps != null
            ? MyCustomStepperWidget(
                stepperType: stepperType,
                formStewardNotifier: validationTriggerNotifier,
                formStewardStateNotifier: formStewardStateNotifier,
                formSteps: _formSteps!,
                currentStep: _stepController.currentStep,
              )
            : const Text("Steps not available"),
      ),
    );
  }
  
  /// Determines the type of stepper layout based on the screen size.
  ///
  /// - For small screens (mobile), the stepper type is set to vertical.
  /// - For medium screens (tablet), the stepper type is horizontal.
  /// - For large screens (desktop), the stepper type is set to tablet.
  StewardStepperType _getFormType() {
    if (ResponsiveHelper.isSmallScreen(context)) {
      return StewardStepperType.vertical;
    } else if (ResponsiveHelper.isMediumScreen(context)) {
      return StewardStepperType.horizontal;
    } else {
      return StewardStepperType.tablet;
    }
  }
}
