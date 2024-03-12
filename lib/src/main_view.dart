import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/size_config.dart';
import '../vues/main_page_view.dart';
import '/bloc/grille_bloc.dart';
import '/utils/strings.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppStrings().init(context);
    return BlocProvider(
        create: (_) => GrilleBloc(),
        child: Scaffold(
          appBar: AppBar(title: Text(AppStrings.appBarTitle)),
          body: const MainPageView(),
        ));
  }
}
