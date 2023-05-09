import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/details.dart';
import '../helpers/frosted_glass.dart';

class CardWithCamera extends StatelessWidget {
  const CardWithCamera({
    super.key,
    required CameraController controller,
  }) : _controller = controller;

  final CameraController _controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    /// we are using Stack widget to place the camera preview at the back of the card.
    /// The card is placed at the front of the camera preview.
    return Stack(
      children: [
        Transform.scale(
            scale: _controller.value.aspectRatio / deviceRatio,
            child: CameraPreview(_controller)),
        Center(
          child: SizedBox(
            height: size.height / 2,
            width: size.width / 1.2,
            child: FrostedGlassBox(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: size.width / 3.5,
                      width: size.width / 3.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(size.width),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/profile.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Shehzaan Mansuri',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Details(
                        icon: Icons.location_on, value: 'Mumbai, India'),
                    const Details(
                      icon: Icons.call,
                      value: '+91 9372968706',
                    ),
                    const Details(
                      icon: Icons.email,
                      value: 'shehzaanmansuri1@gmail.com',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Uri githubUrl = Uri(
                                scheme: 'https',
                                host: 'github.com',
                                path: 'Shehzaan-Mansuri',
                              );
                              launchUrl(githubUrl,
                                  mode: LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // mail
                              Uri mailUrl = Uri(
                                scheme: 'mailto',
                                path: 'shehzaanmansuri1@gmail.com',
                              );
                              launchUrl(mailUrl,
                                  mode: LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Message',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
