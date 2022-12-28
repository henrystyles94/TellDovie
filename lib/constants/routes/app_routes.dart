import 'package:dovie/features/auth/presentation/login_screen.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/pic_login.dart';
import '../../features/bottom navigation/presentation/botom_navigation.dart';
import '../../features/home/presentation/affirmations.dart';
import '../../features/home/presentation/calming_journal.dart';
import '../../features/home/presentation/growth_mindset.dart';
import '../../features/home/presentation/info_hub.dart';
import '../../features/home/presentation/mood_tracker.dart';

var appPageRoutes = [
  GetPage(name: '/welcomePage', page: () => const WelcomeScreen()),
  GetPage(name: '/loginPage', page: () => LoginScreen()),
  GetPage(name: '/bottomNavPage', page: ()=>BottomNavigationScreen()),
  GetPage(name: '/calmingJournalPage', page: ()=>CalmingJournalScreen()),
  GetPage(name: '/moodTrackerPage', page: ()=>MoodTrackerScreen()),
  GetPage(name: '/informationHub', page: ()=>InformationHubScreen()),
  GetPage(name: '/growthMindset', page: ()=>GrowthMindsetScreen()),
  GetPage(name: '/picLogin', page: ()=>PictureLoginScreen()),
  GetPage(name: '/affirmations', page: ()=>AffirmationPage())
];
