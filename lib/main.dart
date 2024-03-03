// import 'package:alarm/alarm.dart';
// import 'package:bulletcalendar/screen/calendar/calender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/view/test_screen/book_appointment_second_screen.dart';
import 'package:get/get.dart';

import 'Store/HiveStore.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore().initBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Apputil.isUserLogged() ? home : login,
      // getPages: NavRouter.generateRoute,
      title: 'FLutter Test',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          canvasColor: Colors.white,
          dividerColor: Colors.transparent),
      // home: CalendarWidget(receivedDate: DateTime.now()),
      home: const BookAppointmentSecondScreen(),
    );
  }
}
