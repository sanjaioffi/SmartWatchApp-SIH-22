// Importing the global variables
import 'globals.dart' as globals;

// Function to calucalte the Body Mass Index
check_bmi(double height, double weight, double bmi) {
  // Determiing the correct weight to match the minimum Body Mass Index value
  // Calculating the weight required to match the closest bmi value
  if (bmi < 24.9) {
    // Calculation part of the overweight users
    globals.expected_weight = 24.8 * (globals.height * globals.height);
  } else if (bmi > 18.4) {
    // Calculation part for under weight users
    globals.expected_weight = 18.4 * (globals.height * globals.height);
  } else {
    // Just returning a  void if not any condition is satisfied
    return;
  }
}

// Calculating the Bmi
bmi_calculation() {
  // Name of the user is fetched from an input box
  // The name is just for representation
  // Age height weight are fetched from an input box
  // Bmi calculation with the formula of (weight in kilograms) / (height in metr
  // es)**2
  globals.bmi = globals.weight / (globals.height * globals.height);
  // Bmi classified into four important parts
  // Below 18.5 is classified as underweight
  // Below 24.6 is classified as Normal range
  // BElow 30 is classified as Over Weight
  // Anything above 30 is classified is Obese
  if (globals.bmi < 18.5) {
    globals.health_status = "Under Weight";
  } else if (globals.bmi < 24.6) {
    globals.health_status = "Normal Weight";
  } else if (globals.bmi < 30) {
    globals.health_status = "Over Weight";
  } else if (globals.bmi > 30) {
    globals.health_status = "Obese";
  }
  // Parsing the bmi into the system only if the bmi is not in the range of 18.4 to 24.9
  // Since the 18.4 to 24.9 is the healthy normal range
  if (globals.bmi > 18.4 && globals.bmi < 25) {
    globals.ishealthy = true;
    return "You are healthy";
  } else {
    globals.ishealthy = false;
    // calling the bmi check function
    check_bmi(globals.height, globals.weight, globals.bmi);
  }
}

void main() {
  // Calling the bmi function
  bmi_calculation();
}
