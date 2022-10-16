// Importing all the global variables
import 'globals.dart' as globals;

// Declaring the monitoring function
monitor_blood_pressure(int systolic, diastolic) {
  // Storing the conditions
  var status = [];
  // Blood Pressure monitoring
  if (systolic < 100) {
    status.add("Danger");
  } else if (systolic < 120) {
    status.add("Normal");
  } else if (systolic < 130) {
    status.add("Elevated");
  } else if (systolic < 140) {
    status.add("High Blood Pressure Stage 1");
  } else if (systolic < 180) {
    status.add("High Blood Pressure Stage 2");
  } else if (systolic > 180) {
    status.add("Hypertensive");
  }
  if (diastolic < 60) {
    status.add("Danger");
  } else if (systolic < 80) {
    status.add("Normal");
  } else if (systolic < 80) {
    status.add("Elevated");
  } else if (systolic < 90) {
    status.add("High Blood Pressure Stage 1");
  } else if (systolic < 120) {
    status.add("High Blood Pressure Stage 2");
  } else if (systolic > 120) {
    status.add("Hypertensive");
  }
  return status;
}

void main() {
  // Calling the monitor function
  monitor_blood_pressure(globals.systolic, globals.diastolic);
}
