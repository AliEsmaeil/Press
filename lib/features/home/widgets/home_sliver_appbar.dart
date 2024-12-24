import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/reusable_widgets/image_from_asset.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_paths.dart';
import 'package:press/core/utils/text_styles.dart';
import 'package:press/features/about_screen/about_screen.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title:Text('Press', style: TextStyles.textStyle18.copyWith(color: AppColors.primaryColor),) ,
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
        expandedTitleScale: 1.5,
        collapseMode: CollapseMode.none,
        background: Image.asset('${AppPaths.imagesPath}background.jpg', fit: BoxFit.cover,),
      ),
      expandedHeight: context.height / 4,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: ImageFromAsset(imageName: 'app-icon.png'),
      ),
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
