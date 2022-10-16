// Storing all the global variables into a dart file and importing it into every essential files
// Library keyword is used to store all the variables and their values
library globals;

import 'package:smartwatch_application_sih/providers/healthdata_provider.dart';

// Defining all the essential variables
var name,
    age,
    gender,
    ishealthy,
    is_under_medication,
    health_status,
    height,
    weight,
    bmi,
    expected_weight,
    food_preference,
    spo2_oxygen,
    calorie_required,
    isdiabetic,
    systolic,
    diastolic,
    stress,
    season,
    weather,
    sleep_distress,
    depression,
    period_length,
    last_period_date,
    hasCholesterol,
    isHeartPatient,
    hasBP,
    health_data,
    food_type;

var food_diet = [];

var sendCharacteristic;
var receiveCharacteristic;

// All of the description of the exercises are mapped with each other
// The Below description is imported into the desired files and the global variables are used
// The local variables are then edited
// A dictionary file to extract the description from the exercise

// Exercise Description
var exercise_data = {
 //exercise of the day
  'lunge front raise': {'asset':'assets/exercise_images/lunge front raise.gif','duration':60,'description':"lunge front raise targets the glutes, quads, hamstrings, the anterior deltoid, and the chest"},
  'arm circles': {'asset':'assets/exercise_images/arm circles.gif','duration':60,'description':"A warm up exercise which activates the muscle tissues in the hand region"},
   'leg swings': {'asset':'assets/exercise_images/leg swings.gif','duration':60,'description':"A warm up exercise which activates the muscle tissues in the leg region"},
  'jumping jacks': {'asset':'assets/exercise_images/jumping jacks.gif','duration':60,'description':"A warm up exercise which improves and circulate the blood all over the body"},
  
  //warm ups
  'ankle circles': {'asset':'assets/exercise_images/ankle circles.gif','duration':60,'description':"A warm up exercise which improves the blood flow in the lower body"},   
  'big arm circles': {'asset':'assets/exercise_images/big arm circles.gif','duration':60,'description':"big arm circles helps to warm up the shoulders, arms, chest, and back"},
  
  //warm downs
  'standing quad stretches': {'asset':'assets/exercise_images/standing quad stretches.gif','duration':60,'description':"A common warm down exercise which regulate the flow of blood after an intense workout"},
  'lunging calf stretches': {'asset':'assets/exercise_images/lunging calf stretches.gif','duration':60,'description':"A common warm down exercise which regulates the flow of blood through out the legs after an intense workout "},
  'childs pose': {'asset':'assets/exercise_images/childs pose.jpeg','duration':60,'description':"A common warm down exercise which regulates the flow of blood through out the body after an intense workout "},
  'single knee to chest': {'asset':'assets/exercise_images/single knee to chest.gif','duration':60,'description':"A common warm down exercise which regulates the flow of blood throughout the lower after an intense workout "},
   
  //hand exercise
   'triceps stretch': {'asset':'assets/exercise_images/triceps stretch.gif','duration':30,'description':"The triceps stretch improves your flexibility and range of motion"},
   'knee push ups': {'asset':'assets/exercise_images/knee push ups.gif','duration':30,'description':"The knee push ups are upper body exercises that also strengthen the core, increase metabolic rate and reduce bone loss"},
   'declined push ups': {'asset':'assets/exercise_images/declined push ups.gif','duration':30,'description':"The decline push ups targets the pec muscles and helps to lift your breasts and strengthen your chest"},
   'normal push ups': {'asset':'assets/exercise_images/normal push ups.gif','duration':30,'description':"The normal push ups targets to strengthen core and shoulders"},
   
  //leg exercise
  'side kicks':{'asset':'assets/exercise_images/side kicks.gif','duration':60,'description':"A common leg workout to improve the blood flow in both of the legs"},
  'flutter kicks':{'asset': 'assets/exercise_images/flutter kicks.gif','duration':60,'description':"A common leg workout to improve the lower abdominal muscles effectively"},
  'donkey kicks':{'asset':'assets/exercise_images/donkey kicks.gif','duration':60,'description':"A common leg workout to improve the blood flow in the inner thigh region"},
  'high knees':{'asset':'assets/exercise_images/high knees.gif','duration':60,'description':"A common leg workout to improve the muscles in the hamstings calves and hip"},
  'leg raises':{'asset':'assets/exercise_images/leg raises.gif','duration':60,'description': "A common leg workout to improve the muscles in lower leg region"},
  
  //cardio exercises
  'jogging in place':{'asset':'assets/exercise_images/jogging in place.gif','duration':60,'description': "A common cardio workout to improve agility and stamina effectively"},
  'squat jumps': {'asset':'assets/exercise_images/squat jumps.gif','duration':60,'description':"A common cardio workout to improve agility and stamina effectively"},
  'cobra stretch':{'asset':'assets/exercise_images/cobra stretch.gif','duration':60,'description':"A common stretching exercise to improve the muscles in the neck region"},
  'trunk rotation':{'asset':'assets/exercise_images/trunk rotation.gif','duration':60,'description':"A common abs workout to improve the muscles in the abs region"},
  
 //abdomen exercises
  'russian twist':{'asset': 'assets/exercise_images/russian twist.gif','duration':60,'description':"A common workout to improve the muscles in the shoulder region"},
  'planck': {'asset':'assets/exercise_images/planck.gif','duration':30,'description':"A common workout to improve the muscles in the abs spine shoulder and much more"},
  'situps': {'asset':'assets/exercise_images/situps.gif','duration':60,'description':"A common workout to improve the abdomen muscles and the lower body muscles"},
  'burpees': {'asset':'assets/exercise_images/burpees.gif','duration':60,'description':"A common exercise to burn fat which helps in regulating the muscles in all over body"},
  'chest fly':{'asset':'assets/exercise_images/chest fly.gif','duration':60,'description':"A common abs workout to improve the muscles in the chest, shoulder and arms"},
  'heel touch':{'asset':'assets/exercise_images/heel touch.gif','duration':60,'description':"A common abs workout to improve the muscles in the abs region as well as the upper chest"},

};

// Yoga exercise description
const yoga_exercise = {'siddhasana': {'asset':'assets/exercise_images/siddhasana.jpg','duration':120,'description':"The siddhasana opens and stretches the inner thighs, groins, hips, and chest, and lengthens the spine."},
 'padmasana': {'asset':'assets/exercise_images/padmasana.jpg','duration':120,'description':"The padmasana stretches the hips, knees, ankles, and thighs, and lengthens the spine."},
  'vajrasana': {'asset':'assets/exercise_images/vajrasana.jpg','duration':120,'description':"The vajrasana stretches the quads, knees, and ankles, lengthens the spine, and calms the brain."},
  'sukhasana': {'asset':'assets/exercise_images/sukhasana.jpg','duration':60,'description':"The sukhasana relaxes and soothes the mind, reduces stress and anxiety levels, and promotes calm and serenity."},
  'parvatasana': {'asset':'assets/exercise_images/parvatasana.jpg','duration':60,'description':"The seated side bend stretches the shoulders and back and strengthens the core."},
'surya mudra': {'asset':'assets/exercise_images/surya mudra.jpg','duration':60,'description':"this mudra in your practice can allow you to feel energized, warmer, and more positive"},
'varun mudra': {'asset':'assets/exercise_images/varun mudra.jpg','duration':60,'description':"varun mudra can give you a plethora of benefits, especially to your skin, eyes, and blood"},
'chin mudra': {'asset':'assets/exercise_images/chin mudra.jpg','duration':60,'description':"Chin Mudra improves concentration memory and power can get rid of all psychological problems such as anger, depression, stress and anxiety."},
'gyan mudra': {'asset':'assets/exercise_images/gyan mudra.jpg','duration':60,'description':"Particularly when held during meditation, gyan mudra can help to increase mental strength, sharpen concentration and improve focus. "},
'namaskar mudra': {'asset':'assets/exercise_images/namaskar mudra.jpg','duration':60,'description':"The mudra placed at the heart center helps to center oneself bringing calmness, harmony, balance, thereby soothing the nerves and nadis"},
'adi mudra': {'asset':'assets/exercise_images/adi mudra.jpg','duration':60,'description':"Adi Mudra benefits your nervous system and enhances the logical ability of your brain"},
'shunya mudra': {'asset':'assets/exercise_images/shunya mudra.jpg','duration':60,'description':"Practicing shunya mudra is thought to provide relief from a range of hearing and balance issues"},
'prithvi mudra': {'asset':'assets/exercise_images/prithvi mudra.jpg','duration':60,'description':" Prithvi Mudra improves your blood circulation, it reduces hair fall, and promotes new hair growth. Since it invigorates the internal organs and tissues, practicing these mudra for hair growth is very effective"},
'prana mudra': {'asset':'assets/exercise_images/prana mudra.jpg','duration':60,'description':"It is the best yoga asana to improve the immune of a human effectively"},
'vayu mudra': {'asset':'assets/exercise_images/vayu mudra.jpg','duration':60,'description':"t is the best yoga asana to improve the aeration of the human body effectively"}
};

// Calorie description for food values
const calorie_description = {
  "Pongal": 116,
  "Idli": 39,
  "Dosa": 133,
  "Poori": 101,
  "Semmiya": 331,
  "Chappathi": 40,
  "Upma": 132,
  "Vada": 73,
  "Banana": 89,
  "Rice": 55,
  "Rasam": 30,
  "Samabar": 60,
  "Curd": 112,
  "Butter Milk": 56,
  "Pappad": 160,
  "Potato": 87,
  "Lady's Fingers": 33,
  "Vegetable Byrani": 241,
  "Beetroot": 33,
  "Milk": 103,
  "Sugar": 16,
  "Egg": 155,
  "Chicken": 239,
  "Mutton": 294,
  "Fish": 206,
  "Paneer Butter Masala": 400,
  "Palak Paneer": 470,
  "Dhal Makhani": 278,
  "Matar Paneer": 299,
  "Rajma Curry": 207,
  "Tawa Paneer": 502,
  "Green Vegetable Salad": 325,
  "Pulao": 180,
  "Pav Bhaji": 400,
  "Poha": 110,
  "Oats": 38,
  "Chicken Tikka": 211,
  "Chicken Chukka": 240
};

// End of all the descriptions