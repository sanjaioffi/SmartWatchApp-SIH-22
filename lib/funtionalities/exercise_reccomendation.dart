import "dart:math";
// Importing all the global variables
import 'globals.dart' as globals;
/* 
Improtant data are logged in this comment
Number of calories lost by taking 10 push ups = 3.2 cal
Number of calories lost by doing jumping jacks for 1 minute = 16 cal
Number of calories lost by doing High Knees for 1 minute = 7 cal
Number of calories lost by doing crunches for 1 minute = 3 cal
Number of calories lost by doing Squat for 1 minute = 8 cal
Number of calories lost by doing burpees for 1 minute = 10 cal
Number of calories lost by doing planck for 1 minute = 5 cal
Number of calories lost by doing chest fly for 1 minute = 4 cal  
Number of calories lost by doing situp for 1 minute = 3 cal
*/



generate_exercise() {
  // Generate ranodm exercises
  var arm_exercises,
      leg_exercises,
      cardio_exercises,
      abdomen_exercises,
      exercise_of_the_day,
      warm_ups,
      warm_downs,
      random;

  // Random function is used to fecth random index number to acces the list elements
  random = Random();
  // Exercise of the day is where all of the exercises that are to be done is stored randomly
  // Exercise of the day consists default warm-up exercise and warn down exercise
  // This exercise module is designed in a way that a user warms up and warm down for two minutes
  // The exercises which burn calories are done for thirteeen minutes

  // The Exercises of the day is stored here
  exercise_of_the_day = [
    "lunge front raise",
    "arm circles",
    "leg swings",
    "jumping jacks",
  ];

  // Warm Up Exercises are listed here
  warm_ups = ["ankle circles", "big arm circles"];

  warm_downs = [
    "standing quad stretches",
    "lunging calf stretches",
    "childs pose",
    "single knee to chest"
  ];

  // Hand Exercising
  arm_exercises = [
    "triceps stretch",
    'knee push ups', 
    'declined push ups',
    'normal push ups',
  ];

  // Leg Exercise
  leg_exercises = [
    "side kicks",
    "flutter kicks",
    "donkey kicks",
    "high knees",
    "leg raises"
  ];

  // Cardio Exercise
  cardio_exercises = [
    "jogging in place",
    "squat jumps",
    "cobra stretch",
    "trunk rotation"
  ];

  // Abdomen Exercise
  abdomen_exercises = [
    "russian twist",
    "planck",
    "situps",
    "burpees",
    "chest fly",
    "heel touch",
  ];
  // Choosing a  random exercise between two warm up exercise
  exercise_of_the_day.add(warm_ups[random.nextInt(2)]);
  // Using a for loop to add 2 exercise from each exercise to mix up the exercise well
  for (int i = 0; i < 2; i++) {
    print(1);
    // Arm Exercise is randomly picked
    exercise_of_the_day.add(arm_exercises[random.nextInt(4)]);
    print(2);
    // Leg exercise is randomlly picked
    exercise_of_the_day.add(leg_exercises[random.nextInt(5)]);
    print(3);
    // Cardio Exercise is picked randomly picked
    exercise_of_the_day.add(cardio_exercises[random.nextInt(4)]);
    print(4);
    // Abdomen Exercise is picked randomly
    exercise_of_the_day.add(abdomen_exercises[random.nextInt(6)]);
    print(5);
  }
  // Warm down exercise is chosen
  exercise_of_the_day.add(warm_downs[random.nextInt(1)]);
  // just checking for duplicates in the final exercise
  var final_warmdown = (warm_downs[random.nextInt(3)]);
  while (
      // Checking te last element for duplicate entry
      final_warmdown == exercise_of_the_day[exercise_of_the_day.length - 1]) {
    // Just randomly generating warm down exercise
    final_warmdown = warm_downs[random.nextInt(3)];
  }
  // Exercises are geb=nerated succesfully
  exercise_of_the_day.add(final_warmdown);
  // The function return the list of exercises
  // Checking the description of the exercises
  // print(exercise_of_the_day);
  // for (int i = 0; i < exercise_of_the_day.length - 1; i++) {
  //   print(globals.description[exercise_of_the_day[i]]);
  // }
  return exercise_of_the_day;
}

// Calories Required Calculation
calculate_calories(double height, double weight, int age, var gender) {
  // Return the calories required to do the needfull
  // The claories required for a day is calculated by Harris Benedict formula
  // Men's calorie needed : 66.5 + 13.8 * weight in kilograms + 5 * height in cm - 6.7550 * age
  // Women's calorie need : 655 + 9.6 * weight in kilograms + 1.9 * height in cm - 4.7 * age
  if (gender == "Male") {
    // Calorie Required for men is calculated and returned
    var calorie_required = 66.5 + (13.8 * weight) + (5 * (height*100)) - (6.8 * age);
    return calorie_required;
  } else if (gender == "Female") {
    // Calorie Required for women is calculated and returned
    var calorie_required = 655 + (9.6 * weight) + (1.9 * (height*100)) - (4.7 * age);
    return calorie_required;
    // If the above condition is not satisfied the below code block is executed
  } else {
    // If the condition is false we return 0
    return 0;
  }
}

void main() {
  // Calling all the functions
  calculate_calories(175/100, 45, 19, 'Male');
}
