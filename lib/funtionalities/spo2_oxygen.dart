import 'globals.dart' as globals;

spo2_analysis(double val) {
  // Spo2 level 95% is considered normal
  if (val > 95) {
    return true;
  }
  // If the spo2 level is low a warning message is returned
  else {
    return false;
  }
}

void main() {
  // Spo2_oxygen_level is the value returned from the esp board
  // Parsing the value to do a small check
  print(spo2_analysis(globals.spo2_oxygen));
}
