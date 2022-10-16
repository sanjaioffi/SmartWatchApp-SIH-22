// Importing the global variables
import 'globals.dart' as globals;

// Importing the random function
import 'dart:math';

// Ranodm function import
var random = Random();

// return advices
return_advices(var advices) {
  // Advices
  var final_advise = [];
  while (final_advise.length != 5) {
    // Goes here
    var advice = advices[random.nextInt(advices.length)];
    bool ispresent = false;
    for (int i = 0; i < final_advise.length; i++) {
      // code
      if (final_advise[i] == advice) {
        ispresent = true;
        break;
      }
    }
    if (!ispresent) {
      final_advise.add(advice);
    }
  }
  return final_advise;
}

// Advices goes here
generate_advices(var climate) {
  // Code goes here
  if (climate == "Summer") {
    // Summer code goes here
    var summer_advices = [
      "Foods which are light to digest are adviced to be taken",
      "Foods like  Rice, lentil are adviced to be taken",
      "Drinking plenty of water and other liquids are adviced to be taken",
      "Reduce going outside in the afternoons",
      "At bedtime milk with sugar candy is adviced to be take",
      "It is adviced to take buttermilk",
      "Fruit Juices are adviced to be taken",
      "Food with pungent and sour taste and warm foods are to be avoided",
      "Staying in cool places",
      "Applying sandalwood and other aromatic pastes over the  is adviced",
      "Wearing light dresses and sleeping at day time are helpful.",
      "Excessive exercise or hardwork is to be avoided",
      "Too much sexual indulgence and alcoholic preparations are not adviced."
    ];
    return return_advices(summer_advices);
  } else if (climate == "Winter") {
    // Winter code here
    var winter_advices = [
      "Foods having Amla (sour) as the predominant taste are preferred",
      " Cereals and pulses, wheat/gram flour products, new rice, corn, and others, are advised",
      "Ginger, garlic, Haritaki , Pippali are adviced",
      "Sugarcane products, and milk and milk products are to be included in the diet. ",
      "Light foods and cold foods are not adviced",
      "Massages with oil/powder/paste",
      "Bath with lukewarm water, exposure to sunlight, and wearing warm clothes are adviced",
      "Exposure to cold wind, excessive walking, sleep at late night, are to be avoided"
    ];
    return return_advices(winter_advices);
  } else if (climate == "Monsoon") {
    // mosoon
    var monsoon_advices = [
      "Foods having Amla sour and salty taste and of unctuous qualities are to be taken",
      "Among cereals, old barley, rice, wheat are advised",
      "Besides vegetable soups it is adviced to have non veg soups",
      " It is mentioned that one should take medicated water or boiled water.",
      "Intake of river water, churned preparations having more water, excessive liquid and wine are to be avoided",
      "Use of boiled water for drinking is adviced",
      "Use of boiled water for bath is advised",
      "Rubbing the body with oil properly after bath is essential",
      "Day sleep is adviced to be avoided",
      "Don't get wet in the climate",
      "sexual indulgence is to be avoided"
    ];

    return return_advices(monsoon_advices);
  } else if (climate == "Spring") {
    // Spring codes goes here
    var spring_advice = [
      "It is adviced to take easily digestible foods",
      "Among cereals, old barley, wheat, rice, and others are preferred",
      "Among pulses, lentils, Mugda, and others, can be taken",
      "Food items tasting bitter, pungent and astringent are to added for lifestyle disorders",
      "Honey is to be included in the diet",
      "Foods which are hard to digest are to be avoided",
      "New grains, curd, cold drinks, and so on, are also to be not adviced",
      "One should use warm water for bathing purposes, and may do exercises",
      "Day-sleep is strictly contraindicated during this season"
    ];
    return return_advices(spring_advice);
  } else if (climate == "Autumn") {
    // Autumn goes here
    var autumn_advices = [
      "Foods have Madhura sweet and bitter taste are advised",
      "Foods having the properties to pacify vitiated Pitta are advised",
      "Wheat, green gram, sugar candy are to be avoided",
      "Hot, bitter, sweet, and astringent foods are to be avoided",
      "The food items, such as fat, oils, meat of aquatic animals not to be included in the food",
      "Habit of eating food, only when there is a feeling of hunger is recommended",
      "One should take water purified by the rays of sun in day time and rays of moon at night time for drinking",
      "Use Boiled Waters to bath",
      "It is said that moon rays in the first 3h of night are conducive for health",
      "Day-sleep, excessive eating, excessive exposure to sunlight are to be avoided."
    ];
    return return_advices(autumn_advices);
  }
}

void main() {
  // calling the function
  print(generate_advices(globals.season));
}
