// Importing the global variables
import 'globals.dart' as globals;

// Importing the dart math function to the application
import "dart:math";

// Random fucntion is stored in a variable named random
var random = Random();

// The breafast food specified is stored inorder to not repeat the same food twice
var breakfast_food_specified = "";

// Declaring the functions
generate_breakfast(var calorie, var food_type) {
  // Diet Separation is separating the calorie required for a day into three equal halves
  // Geneerating the food diets
  if (food_type == "South") {
    // Breakfast foods of south
    var breakfast = [
      "Idli",
      "Dosa",
      "Pongal",
      "Poori",
      "Semmiya",
      "Chappathi",
      "Upma"
    ];
    // Choosing a breakfast randomly
    var breakfast_food = breakfast[random.nextInt(7)];
    breakfast_food_specified = breakfast_food;
    // If the diet food is Idli
    if (breakfast_food == "Idli") {  
      
      // Since it is Idli the calorie value is less we add Vadai as default
      var number_of_dish =
          (calorie - 220) ~/ globals.calorie_description["Idli"];
      globals.food_diet.add("$number_of_dish Idlis and a Vadai with Sambar");
    } else if (breakfast_food == "Dosa") {
      var number_of_dish = calorie ~/ globals.calorie_description["Dosa"];
      globals.food_diet
          .add("${number_of_dish + 1} Dosas with Chutney or Sambar");
    } else if (breakfast_food == "Pongal") {
      var number_of_dish =
          (calorie - 200) ~/ globals.calorie_description["Pongal"];
      globals.food_diet
          .add("${100 * number_of_dish} grams of Pongal with Sambar");
    } else if (breakfast_food == "Poori") {
      var number_of_dish =
          (calorie - 50) ~/ globals.calorie_description["Poori"];
      globals.food_diet.add("$number_of_dish Pooris with  Masal");
    } else if (breakfast_food == "Chappathi") {
      var number_of_dish =
          (calorie - 250) ~/ globals.calorie_description["Chappathi"];
      globals.food_diet.add("$number_of_dish Chappatis with salna");
    } else if (breakfast_food == "Upma") {
      var number_of_dish =
          (calorie - 200) ~/ globals.calorie_description["Upma"];
      globals.food_diet
          .add("${number_of_dish * 100} grams of Upma with kuruma");
    } else if (breakfast_food == "Semmiya") {
      var number_of_dish =
          (calorie - 10) ~/ globals.calorie_description["Semmiya"];
      globals.food_diet.add("$number_of_dish grams of Semmiya with sambar");
    }
  } else if (food_type == "North") {
    var breakfast = [
      "Green Vegetable Salad",
      "Poha",
      "Oats and Milk",
      "Pulao",
      "Chappathi",
    ];
    var breakfast_food = breakfast[random.nextInt(5)];
    if (breakfast_food == "Green Vegetable Salad") {
      var number_of_dish =
          calorie ~/ globals.calorie_description["Green Vegetable Salad"];
      globals.food_diet
          .add("${number_of_dish * 100} grams of Green Vegetable Salad");
      //
    } else if (breakfast_food == "Poha") {
      var number_of_dish = calorie ~/ globals.calorie_description["Poha"];
      globals.food_diet
          .add("${(number_of_dish - 1) * 100} grams of Poha with sambar ");
    } else if (breakfast_food == "Oats and Milk") {
      var number_of_dish = calorie ~/ globals.calorie_description["Oats"];
      globals.food_diet.add("${number_of_dish * 10} grams of Oats with Milk");
    } else if (breakfast_food == "Pulao") {
      var number_of_dish = calorie ~/ globals.calorie_description["Pulao"];
      globals.food_diet
          .add("${number_of_dish * 100} grams of Pulao with Sambar");
    } else if (breakfast_food == "Chappathi") {
      var number_of_dish =
          (calorie - 200) ~/ globals.calorie_description["Chappathi"];
      globals.food_diet.add("${number_of_dish} Chapatthis with Kuruma");
    }
  }
}

generate_lunch(var calorie, var food_type, var food_preference) {
  // Generating the lunch for south india veg
  if (food_type == "South") {
    if (food_preference == "Vegan") {
      var south_vegetables = ["Potato", "Lady's Finger", "Beetroot"];
      var number_of_grams = calorie ~/ globals.calorie_description["Rice"];
      globals.food_diet.add(
          "${(number_of_grams - 5) * 100} grams of White Rice with 20ml Curd 30ml Rasam and 20 grams of ${south_vegetables[random.nextInt(3)]}");
    } else if (food_preference == "Non Vegan") {
      // Non vegan food diet for south indian
      var non_vegan = ["Chicken", "Mutton", "Fish"];
      var lunch = non_vegan[random.nextInt(3)];
      if (lunch == "Chicken") {
        // Chick
        var number_of_grams =
            (calorie - 50) ~/ globals.calorie_description["Chicken"];
        globals.food_diet.add("${number_of_grams * 100} grams of Chicken");
      } else if (lunch == "Mutton") {
        // Mutton
        var number_of_grams =
            (calorie - 50) ~/ globals.calorie_description["Mutton"];
        globals.food_diet.add("${number_of_grams * 100} grams of Mutton");
      } else if (lunch == "Fish") {
        // Fish
        var number_of_grams = calorie ~/ globals.calorie_description["Fish"];
        globals.food_diet.add("${number_of_grams * 100} grams of Fish");
      }
    }
  } else if (food_type == "North") {
    // Food for north
    if (food_preference == "Vegan") {
      // vegan
      var lunch = [
        "Matar Pulao",
        "Shahi Panner",
        "Dum Aloo",
        "Pindi Channa",
        "Dal Tadka",
      ];
      var lunch_dish = lunch[random.nextInt(5)];
      globals.food_diet.add("4 Chapathis with $lunch_dish");
    } else if (food_preference == "Non Vegan") {
      // Non Vegan
      var lunch = ["Chicken Tikka", "Chicken Chukka", "Mutton", "Fish"];
      var lunch_food = lunch[random.nextInt(4)];
      if (lunch_food == "Mutton") {
        // Mutton
        var number_of_grams =
            (calorie - 50) ~/ globals.calorie_description["Mutton"];
        globals.food_diet.add("${number_of_grams * 100} grams of Mutton");
      } else if (lunch_food == "Fish") {
        // Fish
        var number_of_grams = calorie ~/ globals.calorie_description["Fish"];
        globals.food_diet.add("${number_of_grams * 100} grams of Fish");
      } else if (lunch_food == "Chicken Tikka") {
        var number_of_grams =
            (calorie / globals.calorie_description["Chicken Tikka"]) ~/ 1;
        globals.food_diet
            .add("${number_of_grams * 100} grams of Chicken Tikka");
      } else if (lunch_food == "Chicken Chukka") {
        var number_of_grams =
            (calorie / globals.calorie_description["Chicken Chukka"]) ~/ 1;
        globals.food_diet
            .add("${number_of_grams * 100} grams of Chicken Chukka");
      }
    }
  }
}

generate_dinner(var calorie, var food_type) {
  if (food_type == "South") {
    // South Dinner Generation
    var dinner = ["Idli", "Dosa", "Chappathi", "Semmiya", "Poori"];
    var dinner_food = dinner[random.nextInt(5)];
    while (dinner_food == breakfast_food_specified) {
      dinner_food = dinner[random.nextInt(5)];
    }
    if (dinner_food == "Idli") {
      // Since it is Idli the calorie value is less we add Vadai as default
      var number_of_dish =
          (calorie - 220) ~/ globals.calorie_description["Idli"];
      globals.food_diet.add("$number_of_dish Idlis with Sambar");
    } else if (dinner_food == "Dosa") {
      var number_of_dish = calorie ~/ globals.calorie_description["Dosa"];
      globals.food_diet
          .add("${number_of_dish + 1} Dosas with Chutney or Sambar");
    } else if (dinner_food == "Poori") {
      var number_of_dish =
          (calorie - 50) ~/ globals.calorie_description["Poori"];
      globals.food_diet.add("$number_of_dish Pooris with  Masal");
    } else if (dinner_food == "Chappathi") {
      var number_of_dish =
          (calorie - 250) ~/ globals.calorie_description["Chappathi"];
      globals.food_diet.add("$number_of_dish Chappatis with salna");
    } else if (dinner_food == "Upma") {
      var number_of_dish =
          (calorie - 200) ~/ globals.calorie_description["Upma"];
      globals.food_diet
          .add("${number_of_dish * 100} grams of Upma with kuruma");
    } else if (dinner_food == "Semmiya") {
      var number_of_dish = calorie ~/ globals.calorie_description["Semmiya"];
      globals.food_diet
          .add("${number_of_dish * 100} grams of Semmiya with sambar");
    }
  } else if (food_type == "North") {
    //
    var dinner = [
      "Paneer Butter Masala",
      "Palak Paneer",
      "Dhal Makhani",
      "Matar Paneer",
      "Rajma Curry",
      "Tawa Paneer"
    ];
    var dinner_recipie = dinner[random.nextInt(6)];
    if (dinner_recipie == "Paneer Butter Masala") {
      var number_of_grams =
          (calorie / globals.calorie_description["Paneer Butter Masala"]) ~/ 1;
      globals.food_diet.add(
          "${100 * number_of_grams} grams of Panner Butter Masala with 4 Chapathis");
    } else if (dinner_recipie == "Palak Paneer") {
      var number_of_grams =
          (calorie / globals.calorie_description["Palak Paneer"]) ~/ 1;
      globals.food_diet.add(
          "${100 * number_of_grams} grams of Palak Paneer with 4 Chapathis");
    } else if (dinner_recipie == "Dhal Makhani") {
      var number_of_grams =
          (calorie / globals.calorie_description["Dhal Makhani"]) ~/ 1;
      globals.food_diet.add(
          "${100 * number_of_grams} grams of Dal Makhani with 4 Chapathis");
    } else if (dinner_recipie == "Matar Paneer") {
      var number_of_grams =
          (calorie / globals.calorie_description["Matar Paneer"]) ~/ 1;
      globals.food_diet.add(
          "${100 * number_of_grams} grams of Matar Paneer with 4 Chapathis");
    } else if (dinner_recipie == "Rajma Curry") {
      var number_of_grams =
          (calorie / globals.calorie_description["Rajma Curry"]) ~/ 1;
      globals.food_diet
          .add("${number_of_grams * 100} ml of Rajma Curry with 4 Chapathis");
    } else if (dinner_recipie == "Tawa Paneer") {
      var number_of_grams =
          (calorie / globals.calorie_description["Tawa Paneer"]) ~/ 1;
      globals.food_diet.add(
          "${100 * (number_of_grams + 1)} grams of Tawa Paneer with 4 Chapathis");
    } else {
      print("Nothing Specified");
    }
  }
}

diet_plan_generate() {
  var calorie = globals.calorie_required / 3;
  var food_type = globals.food_type;
  var food_preference = globals.food_preference;
  print(globals.calorie_required);
  generate_breakfast(calorie, food_type);
  generate_lunch(calorie, food_type, food_preference);
  generate_dinner(calorie, food_type);
  var diet = globals.food_diet;
  globals.food_diet = [];
  return diet;
}

void main() {
  // Calling the functions
  diet_plan_generate();
}
