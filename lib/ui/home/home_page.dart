import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:long_neck_duck3/constants/app_color.dart';
import 'package:long_neck_duck3/constants/constants_url.dart';
import 'package:long_neck_duck3/core/services/services.dart';
import 'package:long_neck_duck3/ui/components/box_icons_office.dart';
import 'package:long_neck_duck3/ui/style/style.dart';
import 'package:long_neck_duck3/ui/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<String> dropValue = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    final LongNeckDuckProvider provider = Provider.of<LongNeckDuckProvider>(
      context,
    );
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SizedBox.expand(
        child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (context, value, _) => Column(
            spacing: 15,
            children: [
              DragToMoveArea(
                child: Row(
                  mainAxisAlignment: .end,
                  children: [
                    Container(
                      padding: EdgeInsetsGeometry.all(10),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () async => await windowManager.minimize(),
                        child: Icon(
                          FontAwesome.window_minimize_solid,
                          size: 12,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsGeometry.all(10),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () async => await windowManager.close(),
                        child: Icon(
                          EvaIcons.close_outline,
                          size: 18,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Image(
                    image: AssetImage('assets/images/duck_app.png'),
                    width: 160,
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Long Neck Duck',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'By Vinndev',
                        style: TextStyle(
                          color: AppColor.whiteColor.withAlpha(130),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Utils.iconsOffice
                    .map((elements) => BoxIconsOffice(iconsOffice: elements))
                    .toList(),
              ),
              SizedBox(
                height: 35,
                width: 320,
                child: DropdownButtonFormField(
                  alignment: AlignmentDirectional.centerEnd,
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 18,
                    color: AppColor.whiteColor,
                  ),
                  hint: Text(
                    'Choose an Office Version',
                    style: textStyleHintDropDown,
                  ),
                  style: TextStyle(color: AppColor.whiteColor),
                  decoration: inputDecorationDropDown,
                  initialValue: (value.isNotEmpty) ? value : null,
                  dropdownColor: AppColor.mainColor,
                  onChanged: (choose) => dropValue.value = choose.toString(),
                  items: itens
                      .map(
                        (items) =>
                            DropdownMenuItem(value: items, child: Text(items)),
                      )
                      .toList(),
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Text(
                  'Clique para configurar o Pacote Office',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (provider.status != null)
                Text(
                  '\$ ${provider.status}',
                  style: TextStyle(color: AppColor.greenColor),
                ),
              AnimatedContainer(
                duration: Duration(milliseconds: 550),
                child: InkWell(
                  onTap: dropValue.value.isEmpty
                      ? null
                      : (provider.status != null
                            ? null
                            : () =>
                                  provider.configure(dropValue.value, context)),
                  borderRadius: BorderRadius.circular(12),
                  child: Ink(
                    padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
                    decoration: BoxDecoration(
                      color: Color(0xff0bab7c),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      provider.status != null ? 'Aguarde...' : 'Configure',
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
