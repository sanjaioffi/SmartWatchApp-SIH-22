// Importing the global variables
import 'globals.dart' as globals;

// Importing the random function from the math module
import 'dart:math';

// Import random functions
var random = Random();

// Advices
generate_c_advices(int code) {
  // Code goes here
  if (code < 233 && code > 200) {
    // Thunderstorm
    // Generate Execise
    return "Be adviced Thunderstorms are reported";
  } else if (code > 299 && code < 322) {
    // Drizzle
    return "It seems it rains a little outside";
  } else if (code < 532 && code > 499) {
    // Rain
    return "It rains heavy stay safe and warm";
  } else if (code == 800) {
    // Normal & Clear
    return "It is clear outside enjoy your time";
  } else if (code > 800 && code < 805) {
    // Clouds
    return "It is cloudy outside it could rain possibly";
  } else if (code == 701) {
    // Mist code goes here
    return "It is a misty environment outside";
  }
}

void main() {
  // Calling the function
  print(generate_c_advices(230));
}
