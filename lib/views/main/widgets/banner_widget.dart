import 'package:flutter/material.dart';
import 'package:multi_app/models/banner_model.dart';
import 'package:multi_app/services/banner_service.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> _future;

  final String bucketUrl =
      "https://adsstack-adsimagesbucket5151b095-qarop1nniurn.s3.eu-central-1.amazonaws.com/";

  @override
  void initState() {
    super.initState();
    _future = BannerService().getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List<BannerModel>>(
        future: _future,
        builder: (context, snapshot) {
          // 🔥 DEBUG
          print("STATE: ${snapshot.connectionState}");
          print("ERROR: ${snapshot.error}");
          print("DATA: ${snapshot.data}");

          // ⏳ Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final banners = snapshot.data ?? [];

          print("BANNERS LENGTH: ${banners.length}");

          // ❌ Empty
          if (banners.isEmpty) {
            return const Center(child: Text("No banners"));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];

              final imageUrl = bucketUrl + banner.image;

              print("IMAGE URL: $imageUrl");

              return Container(
                width: 320,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,

                    // ⏳ Loading image
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },

                    // ❌ Error image
                    errorBuilder: (context, error, stackTrace) {
                      print("IMAGE ERROR: $error");

                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 40),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
