import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:radovis_tour/helpers/custom_page_route.dart';
import 'package:radovis_tour/provider/data_provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
import 'package:radovis_tour/provider/sign_in_google_provider.dart';
import 'package:radovis_tour/provider/weather_provider.dart';
import 'package:radovis_tour/routes.dart';
import 'package:radovis_tour/widgets/signin/sign_in.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_important_channel',
  'high importance notifications',
  description: 'high channel is used for important notifications!',
  importance: Importance.max,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('A bg message just showed up!: ${message.data}');
  if (message.data.isNotEmpty) {
    return flutterLocalNotificationsPlugin.show(
      0,
      message.data['name'],
      message.data['surname'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.blue,
          playSound: true,
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  var androidInint = new AndroidInitializationSettings('splash');
  var iosInit = new IOSInitializationSettings();
  flutterLocalNotificationsPlugin.initialize(
    InitializationSettings(
      android: androidInint,
      iOS: iosInit,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Weather(),
          ),
          ChangeNotifierProvider.value(
            value: DataProvider(),
          ),
          ChangeNotifierProvider.value(
            value: SignInGoogleProvider(),
          ),
          ChangeNotifierProvider.value(
            value: FirebaseProvider(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

/// Class To Run
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void pushFCMtoken() async {
    String? token = await messaging.getToken();
    print(token);
  }

  @override
  void initState() {
    pushFCMtoken();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.data.isNotEmpty) {
        flutterLocalNotificationsPlugin.show(
          0,
          message.data['name'],
          message.data['surname'],
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
            ),
          ),
        );
      }
    });
    super.initState();
  }

//   @override
//   void initState() {
//     //Remove this method to stop OneSignal Debugging
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//     OneSignal.shared.setAppId("9fac016c-0b2d-4d29-b4b3-d9498ce2d528");

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//       print("Accepted permission: $accepted");
//     });

//     OneSignal.shared.setNotificationWillShowInForegroundHandler(
//         (OSNotificationReceivedEvent event) {
//       // Will be called whenever a notification is received in foreground
//       // Display Notification, pass null param for not displaying the notification
//       event.complete(event.notification);
//     });
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF990000),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomTransition(),
            TargetPlatform.iOS: CustomTransition(),
          },
        ),
      ),
      home: HomePageApp(),
      routes: routes,
    );
  }
}

/// Home Page Class
class HomePageApp extends StatelessWidget {
  final List<IconData> icons = [
    Icons.location_city,
    Icons.nature,
    Icons.nature,
  ];
  @override
  Widget build(BuildContext context) {
    return SignInUser();
  }
}
