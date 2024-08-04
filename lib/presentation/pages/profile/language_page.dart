import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/language/language_provider.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/keyboard_dismisser.dart';
import 'package:puntossmart/presentation/components/loading.dart';
import 'package:puntossmart/presentation/components/select_item.dart';
import 'package:puntossmart/presentation/components/title_icon.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class LanguageScreen extends ConsumerStatefulWidget {
//   final VoidCallback onSave;

//   const LanguageScreen({super.key, required this.onSave});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LanguagePageState();
// }

// class _LanguagePageState extends ConsumerState<LanguageScreen> {

//   int _selectedIndex = -1; // Variable de estado para el índice seleccionado

//   @override
//   void initState() {
//     super.initState();
//     _loadSelectedLanguage();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       //ref.read(languageProvider.notifier).getLanguages(context); //ya no llamamos a la api knjt 25-07-24
//     });
//   }

//   Future<void> _saveLanguagePreference(String languageCode) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('selected_language', languageCode);
//   }

//   Future<void> _loadSelectedLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final selectedLanguage = prefs.getString('selected_language') ?? 'en';

//     setState(() {
//       _selectedIndex = selectedLanguage == 'es' ? 0 : 1;
//     });
//   }

//   Future<String> getLanguagePreference() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('selected_language') ?? 'es'; // 'en' es el valor predeterminado si no hay ningún idioma guardado
//   }



//   @override
//   Widget build(BuildContext context) {
//      final bool isLtr = LocalStorage.getLangLtr();
//     //  final event = ref.read(languageProvider.notifier); //ya no darle uso
//     //  final state = ref.watch(languageProvider); //ya no darle uso
    
//     // Lista estática de idiomas
//     final List<String> languages = [
//       AppLocalizations.of(context)!.spanish,
//       AppLocalizations.of(context)!.english,
//     ];

//     return Directionality(
//       textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
//       child: KeyboardDismisser(
//         child: Container(
//           decoration: BoxDecoration(
//               color: AppStyle.bgGrey.withOpacity(0.96),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16.r),
//                 topRight: Radius.circular(16.r),
//               )),
//           width: double.infinity,
//           child//: state.isLoading
//               //? const Loading()
//               : Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         8.verticalSpace,
//                         Center(
//                           child: Container(
//                             height: 4.h,
//                             width: 48.w,
//                             decoration: BoxDecoration(
//                               color: AppStyle.dragElement,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(40.r),
//                               ),
//                             ),
//                           ),
//                         ),
//                         24.verticalSpace,
//                         TitleAndIcon(
//                           title: AppHelpers.getTranslation(AppLocalizations.of(context)!.select_language/*TrKeys.language*/),
//                           paddingHorizontalSize: 0,
//                           titleSize: 18,
//                         ),
//                         24.verticalSpace,
//                         ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: languages.length,
//                             //itemCount: state.list.length,
//                             itemBuilder: (context, index) {
//                               return SelectItem(
//                                 onTap: () {
//                                   setState(() {
//                                     _selectedIndex = index;
//                                   });
//                                   //event.change(index);
//                                 },
//                                 isActive: _selectedIndex == index,                              
//                                 //isActive: state.index == index,
//                                 //title: state.list[index].title ?? "", 
//                                 title: languages[index],
//                               );
//                             }),
//                         CustomButton(
//                             title: AppHelpers.getTranslation(AppLocalizations.of(context)!.btn_save/*TrKeys.save*/),
//                             onPressed: () {
//                               // ref
//                               //     .read(languageProvider.notifier).
//                               //     .makeSelectedLang(context);
//                               // widget.onSave();

//                               if (_selectedIndex != -1) {
//                                 final selectedLanguageCode = _selectedIndex == 0 ? 'es' : 'en';
//                                 _saveLanguagePreference(selectedLanguageCode);
//                                 debugPrint('Selected language code: $selectedLanguageCode');
//                               }
//                               widget.onSave();
//                             }),
//                         36.verticalSpace,
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }


class LanguageScreen extends ConsumerStatefulWidget {
  final VoidCallback onSave;

  const LanguageScreen({super.key, required this.onSave});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LanguagePageState();
}

class _LanguagePageState extends ConsumerState<LanguageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(languageProvider.notifier).getLanguages(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    final event = ref.read(languageProvider.notifier);
    final state = ref.watch(languageProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Container(
          decoration: BoxDecoration(
              color: AppStyle.bgGrey.withOpacity(0.96),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              )),
          width: double.infinity,
          child: state.isLoading
              ? const Loading()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.verticalSpace,
                        Center(
                          child: Container(
                            height: 4.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              color: AppStyle.dragElement,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.r),
                              ),
                            ),
                          ),
                        ),
                        24.verticalSpace,
                        TitleAndIcon(
                          title: AppHelpers.getTranslation(AppLocalizations.of(context)!.select_language),
                          paddingHorizontalSize: 0,
                          titleSize: 18,
                        ),
                        24.verticalSpace,
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return SelectItem(
                                onTap: () {
                                  event.change(index);
                                },
                                isActive: state.index == index,
                                title: state.list[index].title ?? "",
                              );
                            }),
                        CustomButton(
                            title: AppHelpers.getTranslation(AppLocalizations.of(context)!.btn_save),
                            onPressed: () {
                              ref
                                  .read(languageProvider.notifier)
                                  .makeSelectedLang(context);
                              widget.onSave();
                            }),
                        36.verticalSpace,
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}