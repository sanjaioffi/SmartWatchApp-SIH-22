// Importing the dart math function to the application
import 'dart:math';

// Declaring all the yoga exercise in a list
var yoga_exercises = [
  'siddhasana',
  "padmasana",
  "vajrasana",
  "sukhasana",
  'parvatasana',
  'surya mudra',
  'varun mudra',
  'chin mudra',
  'gyan mudra',
  'namaskar mudra',
  'shunya mudra',
  'prithvi mudra',
  'prana mudra',
  'vayu mudra',
  'adi mudra'
  
];

// Random fucntion is being initialised
var random = Random();

// Declaring the container for all the yoga exercises
var final_exercises = [];

// Generate function is declared
generate_yoga() {
  // Yoga generation starts
  // Initalising the while loop to generate seven random yoga exercises
  while (final_exercises.length != 7) {
    // The bool value is the representation of the existence of the element in the yoga exercise
    bool ispresent = false;
    // Yoga is the variable that holds the randomly picked yoga exercise
    var yoga = yoga_exercises[random.nextInt(10)];
    // Checking  whether the chosen yoga exercise is already in the function
    // Hence initialising a for loop to check the exercise
    for (int i = 0; i < final_exercises.length; i++) {
      // Traversing through out the yoga list to check for the existing element
      if (yoga == final_exercises[i]) {
        // If the yoga is fountd to be present the bool val is changed to true
        ispresent = true;
        // Else nothing is changed
      }
    }
    // If the bool ispresent is false we add the exercise into the final exercise
    if (!ispresent) {
      // Add the exercise into the final exercise
      final_exercises.add(yoga);
    }
  }
  // Returning the yoga exercise
  return final_exercises;
}

void main() {
  // Calling the generate functions
  // Call the below fucntion when you generate yoga exercises
  print(generate_yoga());
}
