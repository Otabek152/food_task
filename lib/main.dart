import 'package:flutter/material.dart';
import 'package:food_task/domain/hive/hive_add.dart';
import 'package:food_task/domain/providers/add_provider.dart';
import 'package:food_task/ui/components/tab_bar_widgets.dart';
import 'package:food_task/ui/pages/tab_pages/home_page.dart';
import 'package:food_task/ui/pages/tab_pages/notification_page.dart';
import 'package:food_task/ui/pages/tab_pages/profile_page.dart';
import 'package:food_task/ui/pages/tab_pages/scan_page.dart';
import 'package:food_task/ui/pages/tab_pages/upload_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveAddAdapter());
  await Hive.openBox<HiveAdd>('foods');
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (context) => AddProvider(),child: const FoodApp()),
    );
  }
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  static List<Widget> screens = [
    const HomePage(),
    const UploadPage(),
    const ScanPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBarWidgets(screens: screens),
    );
  }
}
