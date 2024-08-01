import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/content_screen.dart';



class HomePage extends StatelessWidget {
  final List<String> videos = [
    'https://dl29j83ke081i.cloudfront.net/mixkit.mp4',
    'https://dl29j83ke081i.cloudfront.net/output.mp4',
    'https://dl29j83ke081i.cloudfront.net/output1.mp4',
    'https://mbc1-enc.edgenextcdn.net/out/v1/f5f319206ed740f9a831f2097c2ead23/index.m3u8',
    // 'https://stream.mux.com/LHzQQQeMm9WHezezmSTrKLrGt65gEkpnSW01I4APeZ500.m3u8?redundant_streams=true',
    // 'https://stream.mux.com/gyoLqlPMGsWc00ehBsiV7OFNZauMJodmXdOMiKKFzy9w.m3u8?redundant_streams=true',
    // 'https://stream.mux.com/ZUDSAJANvv1eBMg01QeyB9RdM7uScisSGhmQ02U7b01ZpE.m3u8?redundant_streams=true'
    // 'https://letsupdateskills.com/cdn/video/v2.mp4',
    // 'https://letsupdateskills.com/cdn/video/v1.mp4',
    // 'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    // 'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    // 'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    // 'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    // 'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              //We need swiper for every content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ContentScreen(
                    src: videos[index],
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flutter Shorts',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}