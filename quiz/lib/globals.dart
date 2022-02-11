import 'dart:io';

class Global {
  static String? jwtToken;
  static bool isIOS = Platform.isIOS;
  static bool isAndroid = Platform.isAndroid;

  // package name id to redirect google play console
  // secured -> true, semi-secured, unsecured -> false
  // true -> 1, false -> 0

  // firebase push notification
  static const String apiKeyFirebase =
      "AIzaSyCXQHKibpjrG1_rj3PAoG56vKfFuAtl-44";
  static const String appIdFirebase =
      "1:662014082896:android:132914b222cda33cc63655";
  static const String messagingSenderIdFirebase = "662014082896";
  static const String urlFirebase = "https://fcm.googleapis.com/fcm/send";
  static const String authorizationFirebase =
      "key=AAAAmiMdP1A:APA91bHOVuikZ26YprRamNXAN6kbfAUsZEiAZvll3TFeVEJicqveRPTi3vu4IUD28QNE7RZ5nOBNkt__6PFQdj2H_rtD0TFjRuyWcKsAhAlNCEswpq-dSzBVt5QsiQIAmL-LXkM_Wyua";
  static const String projectIdFirebase = "flutter-firebase-testing";
  static const String contentTypeFirebase = "application/json; charset=UTF-8";

// APPLICATION NAME
//   static const String appNameMain = 'Unique Institute Sanawad';
//   static const String examNameAppWise = 'Unique Institute ';
//   static const String appNameDisplay = "Unique Institute Sanawad";
  // static const String appId = '2213';
  // static const String appHash = 'c04880b02752d6d2a45a91cb517091e';

  // static const String googlePlayStoreRedirect = "com.careerlift.brahmasacademy";
  // static const String appPlayStoreRedirect = "284882215";

  // APPLICATION NAME
  // static const String appNameMain = 'Brilliant Commerce Classes';
  // static const String examNameAppWise = 'Brilliant Commerce Classes';
  // static const String appId = "2317";
  // static const String appHash = "4c110f4f336c63a4243995bad989e10";
  // static const String googlePlayStoreRedirect = "in.speedlabs.brilliantcommerce";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Ignite Academy';
  // static const String examNameAppWise = 'Ignite Academy';
  // static const String appId = "2343";
  // static const String appHash = "179ecb306c2f02776d0de1523138942";
  // static const String googlePlayStoreRedirect = "in.speedlabs.igniteacademy";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Daga Coaching Classes';
  // static const String examNameAppWise = 'Daga Coaching Classes';
  // static const String appId = "2285";
  // static const String appHash = "d04252b586b1986157baf1d62fb9384";
  // static const String googlePlayStoreRedirect = "in.speedlabs.dagacoachingclasses";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Sanskar e-Edutech';
  // static const String examNameAppWise = 'Sanskar e-Edutech';
  // static const String appId = "2290";
  // static const String appHash = "2d518caa612c8f51fd8b3bea48f2ee3";
  // static const String googlePlayStoreRedirect = "in.speedlabs.sanskareedutech";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Hope Institute';
  // static const String examNameAppWise = 'Hope Institute';
  // static const String appId = "1301";
  // static const String appHash = "d7b4a7e3f1b507edda5e9e2e1136b2c";
  // static const String googlePlayStoreRedirect = "in.speedlabs.hopeinstitute";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'V Maheshwari Classes';
  // static const String examNameAppWise = 'V Maheshwari Classes';
  // static const String appId = "2131";
  // static const String appHash = "1f6bf442cd5c18393538f488d2143cb";
  // static const String googlePlayStoreRedirect = "com.careerlift.vmaheshwaricoaching";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Swami Vivekanand Institute';
  // static const String examNameAppWise = 'Swami Vivekanand Institute';
  // static const String appId = "2313";
  // static const String appHash = "70633b25494b14c302872bb3836fc86";
  // static const String googlePlayStoreRedirect = "in.speedlabs.swamivivekanandinstitute";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Creative Study Circle';
  // static const String examNameAppWise = 'Creative Study Circle';
  // static const String appId = "1177";
  // static const String appHash = "40964ffad2d93d82512ee7e2c93c5db";
  // static const String googlePlayStoreRedirect = "in.speedlabs.creativestudycirclebankingacademy";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Mahur education';
  // static const String examNameAppWise = 'Mahur education';
  // static const String appId = "2344";
  // static const String appHash = "1fc4e0e4cb1147bc36013f0b171baf7";
  // static const String googlePlayStoreRedirect = "in.speedlabs.mahureducation";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'ENGLISH RAJENDRA SIR';
  // static const String examNameAppWise = 'ENGLISH RAJENDRA SIR';
  // static const String appId = "2305";
  // static const String appHash = "5f2b9ead8851d752cbc899f39ed87d3";
  // static const String googlePlayStoreRedirect = "com.speedlabstesting.englishrajendrasir";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'RK Study Centre';
  // static const String examNameAppWise = 'RK Study Centre';
  // static const String appId = "2327";
  // static const String appHash = "1f9e46fd5901b8a4214be44db940339";
  // static const String googlePlayStoreRedirect = "in.speedlabs.rkstudycentre";
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'Shiv Classes';
  // static const String examNameAppWise = 'Shiv Classes';
  // static const String appId = "2193";
  // static const String appHash = "23380c9069e7b80535f4f29b9c774ba";
  // static const String googlePlayStoreRedirect = "com.careerlift.shivclasses";
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'ACE ACADEMY KARNAL';
  // static const String examNameAppWise = 'ACE ACADEMY KARNAL';
  // static const String appId = "2227";
  // static const String appHash = "82db561310d8a8d3d7c07d6f0dbd8d9";
  // static const String googlePlayStoreRedirect = "in.speedlabs.aceacademy";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'VIDHYARTHI COACHING';
  // static const String examNameAppWise = 'VIDHYARTHI COACHING';
  // static const String appId = "2273";
  // static const String appHash = "7a3c365ed28c41b236937c1d683dfbc";
  // static const String googlePlayStoreRedirect = "in.speedlabs.vidhyarthicoaching";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'EXCELLENT COACHING INSTITUTE';
  // static const String examNameAppWise = 'EXCELLENT COACHING INSTITUTE';
  // static const String appId = "2319";
  // static const String appHash = "938575703e354a8b5f654e14db76849";
  // static const String googlePlayStoreRedirect = "in.speedlabs.excellentcoachinginstitute";
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'VISION CIVIL SERVICE';
  // static const String examNameAppWise = 'VISION CIVIL SERVICE';
  // static const String appId = "1624";
  // static const String appHash = "df8df79c6ae686f0b83bfbd6c95e781";
  // static const String googlePlayStoreRedirect = "in.speedlabs.visioncivilservice";
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'ACG TUTORIAL';
  // static const String examNameAppWise = 'ACG TUTORIAL';
  // static const String appId = "2203";
  // static const String appHash = "0aa04890241e362e11cf6f04acd9758";
  // static const String googlePlayStoreRedirect = "com.careerlift.acgtutorial";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Lakshya Academy JEE/NEET/MHCET';
  // static const String examNameAppWise = 'Lakshya Academy JEE/NEET/MHCET';
  // static const String appId = "2346";
  // static const String appHash = "4f6432f0ed61a52b4e3ee1100611e60";
  // static const String googlePlayStoreRedirect = "in.speedlabs.lakshyaacademy";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'CT Campus';
  // static const String examNameAppWise = 'CT Campus';
  // static const String appId = "2348";
  // static const String appHash = "89ecdbac320bb4477f3688f932bb60f";
  // static const String googlePlayStoreRedirect = "in.speedlabs.ctcampus";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'PRADCOMM';
  // static const String examNameAppWise = 'PRADCOMM';
  // static const String appId = "2269";
  // static const String appHash = "fa9be7553ad1459f2150f6c44b1a72d";
  // static const String googlePlayStoreRedirect = "in.speedlabs.pradcomm";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Deeksha';
  // static const String examNameAppWise = 'Deeksha';
  // static const String appId = "2316";
  // static const String appHash = "6fb8c8ff8db6c9b426cde44837d348f";
  // static const String googlePlayStoreRedirect = "in.speedlabs.deeksha";
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Banking';
  // static const String examNameAppWise = 'Banking';
  // static const String appNameDisplay = "Banking";
  // static const String appId = '4';
  // static const String appHash = 'd6b4980dd0109e2ec64ec515beb14719';

  // static const String appNameMain = 'GATE';
  // static const String examNameAppWise = 'GATE';
  // static const String appNameDisplay = "GATE";
  // static const String appId = '24';
  // static const String appHash = 'd98730c08d3b1d301592c7e928f9ac9';

  // static const String appNameMain = 'English';
  // static const String examNameAppWise = 'English';
  // static const String appNameDisplay = "English";
  // static const String appId = '25';
  // static const String appHash = '8516cfc3088c46f2485c66e0ff1ca2b';

  // static const String appNameMain = 'Foreign Education';
  // static const String examNameAppWise = 'Foreign Languages';
  // static const String appNameDisplay = "Foreign Education";
  // static const String appId = '26';
  // static const String appHash = '8cad0374bd63445ca6dff43cc59cd51';

  // static const String appNameMain = 'Civil Services';
  // static const String examNameAppWise = 'Civil Services';
  // static const String appNameDisplay = "Civil Services";
  // static const String appId = '27';
  // static const String appHash = '1e1a439174c2b88a8d5566573ed5431';

  // static const String appNameMain = 'School Coaching';
  // static const String examNameAppWise = 'School Coaching';
  // static const String appNameDisplay = "School Coaching";
  // static const String appId = '32';
  // static const String appHash = 'b2ffea208c3d5d3c386c3502377c262';

  // static const String appNameMain = 'Commerce';
  // static const String examNameAppWise = 'Commerce';
  // static const String appNameDisplay = "Commerce";
  // static const String appId = '33';
  // static const String appHash = '3360d5c65d324598fb073ab43403938';

  // static const String appNameMain = 'CLAT';
  // static const String examNameAppWise = 'CLAT';
  // static const String appNameDisplay = "CLAT";
  // static const String appId = '48';
  // static const String appHash = '3a3a7328baac277e9e5bfbf48c8cdc2';

  // static const String appNameMain = 'Creative Study Circle';
  // static const String examNameAppWise = 'Creative Study Circle';
  // static const String appNameDisplay = "Creative Study Circle";
  // static const String appId = '1177';
  // static const String appHash = '40964ffad2d93d82512ee7e2c93c5db';

  // static const String appNameMain = 'GSLV CAREER LAUNCHER';
  // static const String examNameAppWise = 'GSLV CAREER LAUNCHER';
  // static const String appNameDisplay = "GSLV CAREER LAUNCHER";
  // static const String appId = '2292';
  // static const String appHash = '9ff7fb3992fe6e5d2dba1f074cd3693';

  // static const String appNameMain = 'M@theMagicS';
  // static const String examNameAppWise = 'M@theMagicS';
  // static const String appNameDisplay = "M@theMagicS";
  // static const String appId = '2114';
  // static const String appHash = 'eee0351eb145d4466a0d0c866d49a0e';

  // static const String appNameMain = 'Elite Kids Education';
  // static const String examNameAppWise = 'Elite Kids Education';
  // static const String appNameDisplay = "Elite Kids Education";
  // static const String appId = '2256';
  // static const String appHash = 'ed2cc23bd52474e6141dfbaad78e5e1';

  // static const String appNameMain = 'Unique Institute Sanawad';
  // static const String examNameAppWise = 'Unique Institute Sanawad';
  // static const String appNameDisplay = "Unique Institute Sanawad";
  // static const String appId = '2213';
  // static const String appHash = 'c04880b02752d6d2a45a91cb517091e';

  // static const String appNameMain = 'Gharpadh - Best Home Tuition Services';
  // static const String examNameAppWise = 'harpadh';
  // static const String appNameDisplay = "Gharpadh - Best Home Tuition Services";
  // static const String appId = '2177';
  // static const String appHash = 'e237047168f20b93dbe58a240784da9';

  // static const String appNameMain = 'Vijetha Competitions';
  // static const String examNameAppWise = 'Vijetha Competitions';
  // static const String appNameDisplay = "Vijetha Competitions";
  // static const String appId = '2262';
  // static const String appHash = '863015d68abcda1552c84ac7f44dcdc';

  // static const String appNameMain = 'RIELL: Learn English with Shekhar';
  // static const String examNameAppWise = 'RIELL: Learn English with Shekhar';
  // static const String appNameDisplay = "RIELL: Learn English with Shekhar";
  // static const String appId = '2263';
  // static const String appHash = '042310581ff583b95a29ee2db9b4964';

  // static const String appNameMain = 'CATALYST COACHING';
  // static const String examNameAppWise = 'CATALYST COACHING';
  // static const String appNameDisplay = "CATALYST COACHING";
  // static const String appId = '2270';
  // static const String appHash = 'e18d1876df6a354da9e1d98efd41670';
  // static const String appNameMain = 'TATHAGAT IAS';
  // static const String examNameAppWise = 'TATHAGAT IAS';
  // static const String appNameDisplay = "TATHAGAT IAS";
  // static const String appId = '2221';
  // static const String appHash = 'cef8e16e27c7e38036f36750169caf1';

  // static const String appNameMain = 'Any Exam';
  // static const String examNameAppWise = 'Any Exam';
  // static const String appNameDisplay = "Any Exam";
  // static const String appId = '1043';
  // static const String appHash = '72475c87f984f0435e9e5000ded88ff';

  // static const String appNameMain = 'New Success Mantra';
  // static const String examNameAppWise = 'New Success Mantra';
  // static const String appNameDisplay = "New Success Mantra";
  // static const String appId = '2326';
  // static const String appHash = '57913e5e97156bcc36c454a80509fb3';

  // static const String appNameMain = 'RK Study Centre';
  // static const String examNameAppWise = 'RK Study Centre';
  // static const String appNameDisplay = "RK Study Centre";
  // static const String appId = '2327';
  // static const String appHash = '1f9e46fd5901b8a4214be44db940339';

  // static const String appNameMain = 'ACG TUTORIAL';
  // static const String examNameAppWise = 'ACG TUTORIAL';
  // static const String appNameDisplay = "ACG TUTORIAL";
  // static const String appId = '2203';
  // static const String appHash = '0aa04890241e362e11cf6f04acd9758';

  //   static const String appNameMain = 'Unique Institute Sanawad';
  //   static const String examNameAppWise = 'Unique Institute ';
  //   static const String appNameDisplay = "Unique Institute Sanawad";
  //   static const String appId = '2213';
  //   static const String appHash = 'c04880b02752d6d2a45a91cb517091e';

  // static const String googlePlayStoreRedirect = "com.careerlift.brahmasacademy";
  // static const String appPlayStoreRedirect = "284882215";
  //
  // APPLICATION NAME

  static const String appNameMain = 'SpeEdLabs';
  static const String examNameAppWise = 'SpeEdLabs Exam';
  static const String appNameDisplay = "SpeEdLabs";
  static const String appId = '1043';
  static const String googlePlayStoreRedirect = "com.speedlabstesting.demo";
  static const String appHash = '72475c87f984f0435e9e5000ded88ff';
  static const String isSecure = '0';
  static const bool isSecureBool = false;

  // static const String appNameMain = 'Golingo';
  // static const String examNameAppWise = 'Golingo';
  // static const String appId = '2337';
  // static const String googlePlayStoreRedirect = "com.speedlabs.golingo";
  // static const String appHash = '8a25d7b484e901fc7ae9a24a6730453';
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'Speedlabs IIT-JEE';
  // static const String examNameAppWise = 'Speedlabs IIT-JEE';
  // static const String appId = '3006';
  // static const String googlePlayStoreRedirect = "in.speedlabs.edutime";
  // static const String appHash = '68023c08f278466f0c53981d225e541';
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'EduTime';
  // static const String examNameAppWise = 'EduTime';
  // static const String appId = '2350';
  // static const String googlePlayStoreRedirect = "in.speedlabs.edutime";
  // static const String appHash = '1a73bdcb914ee2eed1612f567c4414e';
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'EduTime';
  // static const String examNameAppWise ='EduTime';
  // static const String appId = '2350';
  // static const String googlePlayStoreRedirect = "in.speedlabs.edutime";
  // static const String appHash = '1a73bdcb914ee2eed1612f567c4414e';
  // static const String isSecure = '1';
  // static const bool isSecureBool = true;

  // static const String appNameMain = 'Exam Vision';
  // static const String examNameAppWise ='Exam Vision';
  // static const String appId = '2347';
  // static const String googlePlayStoreRedirect = "in.speedlabs.examvision";
  // static const String appHash = '611189f8edc857d2792fb207a61c303';
  // static const String isSecure = '0';
  // static const bool isSecureBool = false;

  // static const String appNameMain = 'SV NIKETAN';
  // static const String examNameAppWise = 'SV NIKETAN';
  // static const String appNameDisplay = "SV NIKETAN";
  // static const String appId = '1661';
  // static const String appHash = '6bb34d5363ef9ea2966f980f4ad54ae';

  // static const String appNameMain = 'SD Academy';
  // static const String examNameAppWise = 'SD Academy';
  // static const String appNameDisplay = "SD Academy";
  // static const String appId = '1858';
  // static const String appHash = '805a5bfc3555a940a4f39f25f74861d';

  // static const String appNameMain = 'GSLV CAREER LAUNCHER';
  // static const String examNameAppWise = 'GSLV CAREER LAUNCHER';
  // static const String appNameDisplay = "GSLV CAREER LAUNCHER";
  // static const String appId = '2292';
  // static const String appHash = '9ff7fb3992fe6e5d2dba1f074cd3693';

  // static const String appNameMain = 'M@theMagicS';
  // static const String examNameAppWise = 'M@theMagicS';
  // static const String appNameDisplay = "M@theMagicS";
  // static const String appId = '2114';
  // static const String appHash = 'eee0351eb145d4466a0d0c866d49a0e';

  // static const String appNameMain = 'Elite Kids Education';
  // static const String examNameAppWise = 'Elite Kids Education';
  // static const String appNameDisplay = "Elite Kids Education";
  // static const String appId = '2256';
  // static const String appHash = 'ed2cc23bd52474e6141dfbaad78e5e1';

  // static const String appNameMain = 'Unique Institute Sanawad';
  // static const String examNameAppWise = 'Unique Institute Sanawad';
  // static const String appNameDisplay = "Unique Institute Sanawad";
  // static const String appId = '2213';
  // static const String appHash = 'c04880b02752d6d2a45a91cb517091e';

  // static const String appNameMain = 'Gharpadh - Best Home Tuition Services';
  // static const String examNameAppWise = 'Gharpadh';
  // static const String appNameDisplay = "Gharpadh - Best Home Tuition Services";
  // static const String appId = '2177';
  // static const String appHash = 'e237047168f20b93dbe58a240784da9';

  // static const String appNameMain = 'ACE ACADEMY KARNAL';
  // static const String examNameAppWise = 'ACE ACADEMY KARNAL';
  // static const String appNameDisplay = "ACE ACADEMY KARNAL";
  // static const String appId = '2227';
  // static const String appHash = '82db561310d8a8d3d7c07d6f0dbd8d9';

  // static const String appNameMain = 'Vijetha Competitions';
  // static const String examNameAppWise = 'Vijetha Competitions';
  // static const String appNameDisplay = "Vijetha Competitions";
  // static const String appId = '2262';
  // static const String appHash = '863015d68abcda1552c84ac7f44dcdc';

  // static const String appNameMain = 'RIELL: Learn English with Shekhar';
  // static const String examNameAppWise = 'RIELL: Learn English with Shekhar';
  // static const String appNameDisplay = "RIELL: Learn English with Shekhar";
  // static const String appId = '2263';
  // static const String appHash = '042310581ff583b95a29ee2db9b4964';

  // static const String appNameMain = 'PRADCOMM';
  // static const String examNameAppWise = 'PRADCOMM';
  // static const String appNameDisplay = "PRADCOMM";
  // static const String appId = '2269';
  // static const String appHash = 'fa9be7553ad1459f2150f6c44b1a72d';

  // static const String appNameMain = 'Radha Krishna Institute Official App';
  // static const String examNameAppWise = 'Radha Krishna Institute Official App';
  // static const String appNameDisplay = "Radha Krishna Institute Official App";
  // static const String appId = '2278';
  // static const String appHash = '80e70ae284a9718a848b22943b5a594';

  // static const String appNameMain = 'CATALYST COACHING';
  // static const String examNameAppWise = 'CATALYST COACHING';
  // static const String appNameDisplay = "CATALYST COACHING";
  // static const String appId = '2270';
  // static const String appHash = 'e18d1876df6a354da9e1d98efd41670';

  // static const String appNameMain = 'TATHAGAT IAS';
  // static const String examNameAppWise = 'TATHAGAT IAS';
  // static const String appNameDisplay = "TATHAGAT IAS";
  // static const String appId = '2221';
  // static const String appHash = 'cef8e16e27c7e38036f36750169caf1';

  // static const String appNameMain = 'Drishtikon classes';
  // static const String examNameAppWise = 'Drishtikon classes';
  // static const String appNameDisplay = "Drishtikon classes";
  // static const String appId = '2284';
  // static const String appHash = '75147b9877d3c82ab3259ce21ba7fd9';

  // static const String appId = "2103";
  // static const String appHash ="8c45068d9dcc1c8f16f213ab3d422b2";

  static const String versionCode = "86";
  static const String razorPay_testKey = 'rzp_test_X2PgDf0pdphUNu';
}
