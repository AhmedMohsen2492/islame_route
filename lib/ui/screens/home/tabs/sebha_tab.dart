import 'package:flutter/material.dart';
import 'package:islame_route/provider/setting_provider.dart';
import 'package:islame_route/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = [];
  int zkrNumber = 0;

  static int numberOfPraises = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    azkar = [
      AppLocalizations.of(context)!.subhan_allah,
      AppLocalizations.of(context)!.alhamd_allah,
      AppLocalizations.of(context)!.allah_akbar
    ];

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: -74.855,
            child: Image.asset(
              provider.currentTheme == ThemeMode.light
                  ? AppAssets.seb7aHead
                  : AppAssets.seb7aHead_dark,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: AnimatedRotation(
              turns: angle,
              duration: const Duration(milliseconds: 300),
              child: Image(
                image: AssetImage(
                  provider.currentTheme == ThemeMode.light
                      ? AppAssets.seb7aBody
                      : AppAssets.seb7aBody_dark,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        AppLocalizations.of(context)!.number_of_praises,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: provider.currentTheme == ThemeMode.light
              ? AppColors.primary
              : const Color(0xff141A2E),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          "$numberOfPraises",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {
          changeZkr();
        },
        child: Text(
          azkar[zkrNumber],
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ]);
  }

  void changeZkr() {
    setState(() {
      angle += 1 / 33;
    });
    if (numberOfPraises == 33) {
      numberOfPraises = 0;
      if (zkrNumber == azkar.length - 1) {
        zkrNumber = 0;
      } else {
        zkrNumber++;
      }
    } else {
      numberOfPraises++;
    }
  }
}
