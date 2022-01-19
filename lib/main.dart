// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:things_register2/screens/main_screen.dart';
// import 'package:things_register2/util/const.dart';
//
// void main() async {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: Constants.appName,
//       theme: Constants.lightTheme,
//       darkTheme: Constants.darkTheme,
//       home: MainScreen(),
//     );
//   }
// }

//
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';
//
//
//
// Future<void> main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
//   final cameras = await availableCameras();
//
//   // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
//   final firstCamera = cameras.first;
//
//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // 적절한 카메라를 TakePictureScreen 위젯에게 전달합니다.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }
//
// // 사용자가 주어진 카메라를 사용하여 사진을 찍을 수 있는 화면
// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;
//
//   const TakePictureScreen({
//     Key key,
//     @required this.camera,
//   }) : super(key: key);
//
//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }
//
// class TakePictureScreenState extends State<TakePictureScreen> {
//   CameraController _controller;
//   Future<void> _initializeControllerFuture;
//
//
//   @override
//   void initState() {
//     super.initState();
//     // 카메라의 현재 출력물을 보여주기 위해 CameraController를 생성합니다.
//     _controller = CameraController(
//       // 이용 가능한 카메라 목록에서 특정 카메라를 가져옵니다.
//       widget.camera,
//       // 적용할 해상도를 지정합니다.
//       ResolutionPreset.medium,
//     );
//
//     // 다음으로 controller를 초기화합니다. 초기화 메서드는 Future를 반환합니다.
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Take a picture')),
//       // 카메라 프리뷰를 보여주기 전에 컨트롤러 초기화를 기다려야 합니다. 컨트롤러 초기화가
//       // 완료될 때까지 FutureBuilder를 사용하여 로딩 스피너를 보여주세요.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // Future가 완료되면, 프리뷰를 보여줍니다.
//             return CameraPreview(_controller);
//           } else {
//             // 그렇지 않다면, 진행 표시기를 보여줍니다.
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt),
//         // onPressed 콜백을 제공합니다.
//         onPressed: () async {
//           // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
//           // 대응할 수 있습니다.
//           try {
//             // 카메라 초기화가 완료됐는지 확인합니다.
//             await _initializeControllerFuture;
//
//             // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.
//             final path = join(
//               // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
//               // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );
//
//             // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
//             await _controller.takePicture(path);
//
//             // 사진을 촬영하면, 새로운 화면으로 넘어갑니다.
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: path),
//               ),
//             );
//           } catch (e) {
//             // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }
//
// // 사용자가 촬영한 사진을 보여주는 위젯
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//
//   const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Display the Picture')),
//       // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
//       // 경로로 `Image.file`을 생성하세요.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }



import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}