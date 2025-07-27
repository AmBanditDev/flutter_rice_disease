import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/camera_screen.dart';
import 'package:flutter_rice_disease/screens/pickImage_screen.dart';
import 'package:flutter_rice_disease/screens/search_main_screen.dart';
import 'screens/aboutus_screen.dart';

// Colors
Color firstColor = const Color.fromARGB(255, 62, 225, 59);
Color secondColor = const Color.fromARGB(255, 4, 184, 0);
Color thirdColor = const Color.fromARGB(255, 253, 192, 74);
Color fontColor = const Color.fromARGB(255, 80, 80, 80);
Color lightGreen = Colors.lightGreen.shade50;

// Responsive Size
const mobileWidth = 500;

// Labels
const bacterial_blight = "โรคขอบใบแห้ง";
const blast = "โรคไหม้";
const brown_spot = "โรคใบจุดสีน้ำตาล";
const diseaseFree = "ใบข้าวไม่เป็นโรค";
const general = "ไม่ใช่ภาพใบข้าว";

// About ButtonMenu
final buttonIcon = [
  "assets/icons/camera.png",
  "assets/icons/gallery.png",
  "assets/icons/search.png",
  "assets/icons/info.png",
];
final buttonText = [
  "ถ่ายภาพ\nตรวจโรคข้าว",
  "เลือกภาพ\nตรวจโรคข้าว",
  "ค้นหาทั่วไป",
  "เกี่ยวกับเรา",
];
final buttonScreen = [
  CameraScreen(),
  PickImageScreen(),
  SearchMainScreen(),
  AboutUsScreen(),
];

// About API
const api_replit =
    'https://rice-disease-api.banditdev013.repl.co/rice-disease/';
const api_hostinger_view =
    'https://backend-rice-diseases.com/services_flutter/view_rice_diseases.php';
const api_search_rice_disease =
    'https://backend-rice-diseases.com/services_flutter/search_rice_diseases.php';
const api_search_rice_varieties =
    'https://backend-rice-diseases.com/services_flutter/search_rice_varieties.php';

// Address Image Link
const link_rice_disease_img =
    'https://backend-rice-diseases.com/uploads/rice_diseases_img/';
const link_rice_varieties_img =
    'https://backend-rice-diseases.com/uploads/rice_varieties_img/';
