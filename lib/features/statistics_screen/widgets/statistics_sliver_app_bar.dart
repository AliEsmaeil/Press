import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/reusable_widgets/image_from_asset.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_paths.dart';
import 'package:press/core/utils/text_styles.dart';
import 'package:press/features/about_screen/about_screen.dart';

class StatisticsSliverAppBar extends StatelessWidget {
  const StatisticsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title:Text('Data Statistics', style: TextStyles.textStyle18.copyWith(color: AppColors.primaryColor),) ,
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
        collapseMode: CollapseMode.none,
        background: Image.asset('${AppPaths.imagesPath}dataStatisticsBackground.jpg', fit: BoxFit.cover,),
        expandedTitleScale: 1.5,
      ),
      expandedHeight: context.height / 4,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: (){
            Navigator.of(context).pushNamed(AboutScreen.routeName);
          },
        )
      ],
    );
  }
}
