
import 'package:flutter/material.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/features/home/widgets/pre_paid_widget.dart';


class PrePaidCardsScreen extends StatelessWidget {
  const PrePaidCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: appGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                  const Text(
                    'Pre-paid cards',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    PrePaidCard('شركة ليبيانا', Icons.arrow_back, Icons.network_cell),
                    PrePaidCard('شركة المدار الجديد', Icons.arrow_back, Icons.phone_android),
                    PrePaidCard('شركة ليبيا للاتصالات', Icons.arrow_back, Icons.wifi),
                    PrePaidCard('Google Play', Icons.arrow_back, Icons.play_arrow),
                    PrePaidCard('iTunes', Icons.arrow_back, Icons.music_note),
                    PrePaidCard('RAZER GOLD', Icons.arrow_back, Icons.videogame_asset),
                    PrePaidCard('AMAZON', Icons.arrow_back, Icons.shopping_cart),
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
