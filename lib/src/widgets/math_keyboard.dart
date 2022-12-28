import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_math_keyboard/src/custom_key_icons/custom_key_icons.dart';
import 'package:flutter_math_keyboard/src/foundation/keyboard_button.dart';
import 'package:flutter_math_keyboard/src/foundation/node.dart';
import 'package:flutter_math_keyboard/src/widgets/decimal_separator.dart';
import 'package:flutter_math_keyboard/src/widgets/keyboard_button.dart';
import 'package:flutter_math_keyboard/src/widgets/math_field.dart';
import 'package:flutter_math_keyboard/src/widgets/view_insets.dart';
import 'package:flutter_math_keyboard/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Enumeration for the types of keyboard that a math keyboard can adopt.
///
/// This way we allow different button configurations. The user may only need to
/// input a number.
enum MathKeyboardType {
  /// Keyboard for entering complete math expressions.
  ///
  /// This shows numbers + operators and a toggle button to switch to another
  /// page with extended functions.
  expression,

  /// Keyboard for number input only.
  numberOnly,
}

/// Widget displaying the math keyboard.
class MathKeyboard extends StatefulWidget {
  /// Constructs a [MathKeyboard].
  const MathKeyboard({
    Key? key,
    required this.controller,
    this.type = MathKeyboardType.expression,
    this.variables = const [],
    this.onSubmit,
    this.insetsState,
    this.slideAnimation,
  }) : super(key: key);

  /// The controller for editing the math field.
  ///
  /// Must not be `null`.
  final MathFieldEditingController controller;

  /// The state for reporting the keyboard insets.
  ///
  /// If `null`, the math keyboard will not report about its bottom inset.
  final MathKeyboardViewInsetsState? insetsState;

  /// Animation that indicates the current slide progress of the keyboard.
  ///
  /// If `null`, the keyboard is always fully slided out.
  final Animation<double>? slideAnimation;

  /// The Variables a user can use.
  final List<String> variables;

  /// The Type of the Keyboard.
  final MathKeyboardType type;

  /// Function that is called when the enter / submit button is tapped.
  ///
  /// Can be `null`.
  final VoidCallback? onSubmit;

  @override
  State<MathKeyboard> createState() => _MathKeyboardState();
}

class _MathKeyboardState extends State<MathKeyboard> {
   List<List<KeyboardButtonConfig>>  recentList = [];
  bool _capsOn = false;


//   void recent()async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String> recentStringList=pref.getStringList("recent") ?? [];
//     if(recentStringList.isEmpty)
//     {
//       return;
//     }
//    recentStringList= recentStringList.reversed.toList();
//     int count = 0;
//     recentList=[];
//     for(int i =0; i<4;i++)
//     {

//       recentList.add([]);
//       for(int j =0; j<5;j++){
//         if(recentStringList.length<=count)
//         {
//               break;
//         }
//     List<String> values=recentStringList[count].split(" , ");
      
//     recentList[i].add(BasicKeyboardButtonConfig(label: values[1], value: values[0],asTex: true,args: values[2]=="null" ? [] : [TeXArg.braces]));

//     count+=1;
//       }
//     }
//     recentList.add([]);

    
    
//     recentList[4].add(const BasicKeyboardButtonConfig(
//       label: '(',
//       value: '(',
//       highlighted: true,
//       keyboardCharacters: ['('],
//     ),);
//    recentList[4].add(const BasicKeyboardButtonConfig(
//       label: ')',
//       value: ')',
//       highlighted: true,
//       keyboardCharacters: [')'],
//     ),);
//    recentList[4].add(PreviousButtonConfig());
//    recentList[4].add(NextButtonConfig());
//    recentList[4].add(DeleteButtonConfig());
  

//     recentList.add([]);
//    recentList[5].add(PageButtonOneConfig());
//    recentList[5].add(PageButtonTwoConfig());
//    recentList[5].add(PageButtonThreeConfig());
//    recentList[5].add(PageButtonFourConfig());
//    recentList[5].add(PageButtonFiveConfig());
//    recentList[5].add(PageButtonSixConfig());
//    recentList[5].add(PageButtonSevenConfig());
// setState(() {
  
// });
    
//   }
  @override
  void initState() {
    super.initState();
    // recent();
    _capsOn = _isCapsLockOn();
    RawKeyboard.instance.addListener(_onKeyEvent);
  }

  void _onKeyEvent(RawKeyEvent event) {
    if (event.physicalKey == PhysicalKeyboardKey.shiftLeft ||
        event.physicalKey == PhysicalKeyboardKey.shiftRight) {
      setState(() {
        _capsOn = _isCapsLockOn();
      });
    }
  }

  bool _isCapsLockOn() {
    return RawKeyboard.instance.keysPressed
            .contains(PhysicalKeyboardKey.shiftLeft) ||
        RawKeyboard.instance.keysPressed
            .contains(LogicalKeyboardKey.shiftLeft) ||
        RawKeyboard.instance.keysPressed
            .contains(PhysicalKeyboardKey.shiftRight) ||
        RawKeyboard.instance.keysPressed
            .contains(LogicalKeyboardKey.shiftRight);
  }

  @override
  Widget build(BuildContext context) {

    final curvedSlideAnimation = CurvedAnimation(
      parent: widget.slideAnimation ?? AlwaysStoppedAnimation(1),
      curve: Curves.ease,
    );
  
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(curvedSlideAnimation),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Material(
              color: Color(0xffC2DADD),
              type: MaterialType.card,
              elevation: 20,
              // borderRadius: 5,
              // animationDuration: hours: 0, minutes: 0, seconds: 4,
              child: ColoredBox(
                color: OleSchoolNewTheme.themeColor.primaryColorLight,
                child: SafeArea(
                  top: false,
                  child: _KeyboardBody(
                    insetsState: widget.insetsState,
                    slideAnimation: widget.slideAnimation == null
                        ? null
                        : curvedSlideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 4,
                        left: 4,
                        right: 4,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 10,
                          ),
                          child: Column(
                            children: [
                              // if (widget.type != MathKeyboardType.numberOnly)
                              //   _Variables(
                              //     controller: widget.controller,
                              //     variables: widget.variables,
                              //   ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                ),
                                child: _Buttons(
                                  controller: widget.controller,

                                  page1: 
                                  //recentList.isEmpty ? 
                                   functionKeyboard ,
                                 //  : recentList,
                                  // widget.type == MathKeyboardType.numberOnly
                                  //     ? numberKeyboard
                                  //     : standartKeryboard(_capsOn),
                                  page2: arithmeticKeyboard,
                                  // widget.type == MathKeyboardType.numberOnly
                                  //     ? null
                                  //     : functionKeyboard,
                                  page3: PowerGreekExponentKeyboard,
                                  page4: GeometryTriangleLinesKeyboard,
                                  page5: TrignoIntergDiff,
                                  page6: setTheoryKeyboard,
                                  onSubmit: widget.onSubmit,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget that reports about the math keyboard body's bottom inset.
class _KeyboardBody extends StatefulWidget {
  const _KeyboardBody({
    Key? key,
    this.insetsState,
    this.slideAnimation,
    required this.child,
  }) : super(key: key);

  final MathKeyboardViewInsetsState? insetsState;

  /// The animation for sliding the keyboard.
  ///
  /// This is used in the body for reporting fractional sliding progress, i.e.
  /// reporting a smaller size while sliding.
  final Animation<double>? slideAnimation;

  final Widget child;

  @override
  _KeyboardBodyState createState() => _KeyboardBodyState();
}

class _KeyboardBodyState extends State<_KeyboardBody> {
  @override
  void initState() {
    super.initState();

    widget.slideAnimation?.addListener(_handleAnimation);
  }

  @override
  void didUpdateWidget(_KeyboardBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.insetsState != widget.insetsState) {
      _removeInsets(oldWidget.insetsState);
      _reportInsets(widget.insetsState);
    }

    if (oldWidget.slideAnimation != widget.slideAnimation) {
      oldWidget.slideAnimation?.removeListener(_handleAnimation);
      widget.slideAnimation?.addListener(_handleAnimation);
    }
  }

  @override
  void dispose() {
    _removeInsets(widget.insetsState);
    widget.slideAnimation?.removeListener(_handleAnimation);

    super.dispose();
  }

  void _handleAnimation() {
    _reportInsets(widget.insetsState);
  }

  void _removeInsets(MathKeyboardViewInsetsState? insetsState) {
    if (insetsState == null) return;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.insetsState![ObjectKey(this)] = null;
    });
  }

  void _reportInsets(MathKeyboardViewInsetsState? insetsState) {
    if (insetsState == null) return;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final renderBox = context.findRenderObject() as RenderBox;
      insetsState[ObjectKey(this)] =
          renderBox.size.height * (widget.slideAnimation?.value ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    _reportInsets(widget.insetsState);
    return widget.child;
  }
}

/// Widget showing the variables a user can use.
class _Variables extends StatefulWidget {
  /// Constructs a [_Variables] Widget.
  const _Variables({
    Key? key,
    required this.controller,
    required this.variables,
  }) : super(key: key);

  /// The editing controller for the math field that the variables are connected
  /// to.
  final MathFieldEditingController controller;

  /// The variables to show.
  final List<String> variables;

  @override
  State<_Variables> createState() => _VariablesState();
}

class _VariablesState extends State<_Variables> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      height: 54,
      color: OleSchoolNewTheme.themeColor.primaryColorLight,
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return ListView.separated(
            itemCount: widget.variables.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return Center(
                child: Container(
                  height: 24,
                  width: 1,
                  color: OleSchoolNewTheme.themeColor.primaryColorLight,
                ),
              );
            },
            itemBuilder: (context, index) {
              return SizedBox(
                width: 40,
                height: 40,
                child: _VariableButton(
                  name: widget.variables[index],
                  onTap: () {
                    widget.controller.addLeaf('{${widget.variables[index]}}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  
}


/// Widget displaying the buttons.
class _Buttons extends StatefulWidget {

  /// Constructs a [_Buttons] Widget.
  const _Buttons({
    Key? key,
    // required this.onTap,
    required this.controller,
    this.page1,
    this.page2,
    this.page3,
    this.page4,
    this.page5,
    this.page6,
    // this.page7,
    this.onSubmit,
  }) : super(key: key);

  // final Function() onTap;

  /// The editing controller for the math field that the variables are connected
  /// to.
  
  final MathFieldEditingController controller;

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page1;
  

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page2;

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page3;

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page4;

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page5;

  /// The buttons to display.
  final List<List<KeyboardButtonConfig>>? page6;

  /// The buttons to display.
  // final List<List<KeyboardButtonConfig>>? page7;

  /// Function that is called when the enter / submit button is tapped.
  ///
  /// Can be `null`.
  final VoidCallback? onSubmit;

  @override
  State<_Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<_Buttons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 266,
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          List<List<KeyboardButtonConfig>> layout = [];
          if (widget.controller.secondPage == 1) layout = widget.page1 ?? numberKeyboard;
          if (widget.controller.secondPage == 2) layout = widget.page2 ?? numberKeyboard;
          if (widget.controller.secondPage == 3) layout = widget.page3 ?? numberKeyboard;
          if (widget.controller.secondPage == 4) layout = widget.page4 ?? numberKeyboard;
          if (widget.controller.secondPage == 5) layout = widget.page5 ?? numberKeyboard;
          if (widget.controller.secondPage == 6) layout = widget.page6 ?? numberKeyboard;
          // if (controller.secondPage == 7) layout = page7 ?? numberKeyboard;

          return Column(
            children: [
              for (final row in layout)
                Container(
                  color: Color(0xffC2DADD),
                  height: 44,
                  width: MediaQuery.of(context).size.width * .6,
                  child: Row(
                    children: [
                      for (final config in row)
                        if (config is BasicKeyboardButtonConfig)
                          _BasicButton(
                            flex: config.flex,
                            label: config.label,
                            onTap: config.args != null
                                ? () {
                                  widget.controller.addFunction(
                                      config.value,
                                      config.args!,
                                      config.label,
                                

                                    );
                                }
                                : () => widget.controller.addLeaf(config.value),
                            asTex: config.asTex,
                            highlightLevel: config.highlighted ? 1 : 0,
                          )
                        else if (config is DeleteButtonConfig)
                          _NavigationButton(
                            flex: config.flex,
                            icon: Icons.backspace,
                            iconSize: 22,
                            onTap: () => widget.controller.goBack(deleteMode: true),
                          )
                        else if (config is PageButtonOneConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '1',
                            onTap: () => widget.controller.togglePage(1),
                            highlightLevel: 1,
                          )
                        else if (config is PageButtonTwoConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '2',
                            onTap: () => widget.controller.togglePage(2),
                            highlightLevel: 1,
                          )
                        else if (config is PageButtonThreeConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '3',
                            onTap: () => widget.controller.togglePage(3),
                            highlightLevel: 1,
                          )
                        else if (config is PageButtonFourConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '4',
                            onTap: () => widget.controller.togglePage(4),
                            highlightLevel: 1,
                          )
                        else if (config is PageButtonFiveConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '5',
                            onTap: () => widget.controller.togglePage(5),
                            highlightLevel: 1,
                          )
                        else if (config is PageButtonSixConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: CustomKeyIcons.key_symbols,
                            label: '6',
                            onTap: () => widget.controller.togglePage(6),
                            highlightLevel: 1,
                          )
                        // else if (config is PageButtonSevenConfig)
                        //   _BasicButton(
                        //     flex: config.flex,
                        //     icon: CustomKeyIcons.key_symbols,
                        //     label: '7',
                        //     onTap: () => controller.togglePage(7),
                        //     highlightLevel: 1,
                        //   )
                        else if (config is PreviousButtonConfig)
                          _NavigationButton(
                            flex: config.flex,
                            icon: Icons.chevron_left_rounded,
                            onTap: widget.controller.goBack,
                          )
                        else if (config is NextButtonConfig)
                          _NavigationButton(
                            flex: config.flex,
                            icon: Icons.chevron_right_rounded,
                            onTap: widget.controller.goNext,
                          )
                        else if (config is SubmitButtonConfig)
                          _BasicButton(
                            flex: config.flex,
                            icon: Icons.keyboard_return,
                            onTap: widget.onSubmit,
                            highlightLevel: 2,
                          ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

}

/// Widget displaying a single keyboard button.
class _BasicButton extends StatelessWidget {
  /// Constructs a [_BasicButton].
  const _BasicButton({
    Key? key,
    required this.flex,
    this.label,
    this.icon,
    this.onTap,
    this.asTex = false,
    this.highlightLevel = 0,
  })  : assert(label != null || icon != null),
        super(key: key);

  /// The flexible flex value.
  final int? flex;

  /// The label for this button.
  final String? label;

  /// Icon for this button.
  final IconData? icon;

  /// Function to be called on tap.
  final VoidCallback? onTap;

  /// Show label as tex.
  final bool asTex;

  /// Whether this button should be highlighted.
  final int highlightLevel;

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (label == null) {
      result = Icon(
        icon,
        color: Colors.black,
      );
    } else if (asTex) {
      result = Math.tex(
        label!,
        textStyle: TextStyle(fontFamily: GoogleFonts.varelaRound().fontFamily),
        options: MathOptions(
          fontSize: 20,
          color: Colors.black,
        ),
      );
    } else {
      var symbol = label;
      if (label == '.') {
        // We want to display the decimal separator differently depending
        // on the current locale.
        symbol = decimalSeparator(context);
      }

      result = Text(
        symbol!,
        style: TextStyle(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
          fontSize: 20,
          color: Colors.white,
        ),
      );
    }

    result = KeyboardButton(
      onTap: onTap,
      color: highlightLevel > 1
          ? Theme.of(context).colorScheme.secondary
          : highlightLevel == 1
              ? OleSchoolNewTheme.themeColor.primaryColorDark
              : null,
      child: result,
    );

    return Expanded(
      flex: flex ?? 2,
      child: result,
    );
  }
}

/// Keyboard button for navigation actions.
class _NavigationButton extends StatelessWidget {
  /// Constructs a [_NavigationButton].
  const _NavigationButton({
    Key? key,
    required this.flex,
    this.icon,
    this.iconSize = 36,
    this.onTap,
  }) : super(key: key);

  /// The flexible flex value.
  final int? flex;

  /// Icon to be shown.
  final IconData? icon;

  /// The size for the icon.
  final double iconSize;

  /// Function used when user holds the button down.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 2,
      child: KeyboardButton(
        onTap: onTap,
        onHold: onTap,
        //COLOR OF navigate and backspace BUTTON

        color: OleSchoolNewTheme.themeColor.primaryColorDark,
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}

/// Widget for variable keyboard buttons.
class _VariableButton extends StatelessWidget {
  /// Constructs a [_VariableButton] widget.
  const _VariableButton({
    Key? key,
    required this.name,
    this.onTap,
  }) : super(key: key);

  /// The variable name.
  final String name;

  /// Called when the button is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return KeyboardButton(
      //COLOR OF VARIABLE BUTTON
      color: OleSchoolNewTheme.themeColor.primaryColorDark,
      onTap: onTap,
      child: Math.tex(
        name,
        textStyle: TextStyle(fontFamily: GoogleFonts.varelaRound().fontFamily),
        options: MathOptions(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
