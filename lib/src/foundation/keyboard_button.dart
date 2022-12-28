import 'package:flutter/services.dart';
import 'package:flutter_math_keyboard/src/foundation/node.dart';

/// Class representing a button configuration.
abstract class KeyboardButtonConfig {
  /// Constructs a [KeyboardButtonConfig].
  const KeyboardButtonConfig({
    this.flex,
    this.keyboardCharacters = const [],
  });

  /// Optional flex.
  final int? flex;

  /// The list of [RawKeyEvent.character] that should trigger this keyboard
  /// button on a physical keyboard.
  ///
  /// Note that the case of the characters is ignored.
  ///
  /// Special keyboard keys like backspace and arrow keys are specially handled
  /// and do *not* require this to be set.
  ///
  /// Must not be `null` but can be empty.
  final List<String> keyboardCharacters;
}

/// Class representing a button configuration for a [FunctionButton].
class BasicKeyboardButtonConfig extends KeyboardButtonConfig {
  /// Constructs a [KeyboardButtonConfig].
  const BasicKeyboardButtonConfig({
    required this.label,
    required this.value,
    this.args,
    this.asTex = false,
    this.highlighted = false,
    List<String> keyboardCharacters = const [],
    int? flex,
  }) : super(
          flex: flex,
          keyboardCharacters: keyboardCharacters,
        );

  /// The label of the button.
  final String label;

  /// The value in tex.
  final String value;

  /// List defining the arguments for the function behind this button.
  final List<TeXArg>? args;

  /// Whether to display the label as TeX or as plain text.
  final bool asTex;

  /// The highlight level of this button.
  final bool highlighted;
}

/// Class representing a button configuration of the Delete Button.
class DeleteButtonConfig extends KeyboardButtonConfig {
  /// Constructs a [DeleteButtonConfig].
  DeleteButtonConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Previous Button.
class PreviousButtonConfig extends KeyboardButtonConfig {
  /// Constructs a [DeleteButtonConfig].
  PreviousButtonConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Next Button.
class NextButtonConfig extends KeyboardButtonConfig {
  /// Constructs a [DeleteButtonConfig].
  NextButtonConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Submit Button.
class SubmitButtonConfig extends KeyboardButtonConfig {
  /// Constructs a [SubmitButtonConfig].
  SubmitButtonConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonOneConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonOneConfig].
  const PageButtonOneConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonTwoConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonTwoConfig].
  const PageButtonTwoConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonThreeConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonThreeConfig].
  const PageButtonThreeConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.

class PageButtonFourConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonFourConfig].
  const PageButtonFourConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonFiveConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonFiveConfig].
  const PageButtonFiveConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonSixConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonSixConfig].
  const PageButtonSixConfig({int? flex}) : super(flex: flex);
}

/// Class representing a button configuration of the Page Toggle Button.
class PageButtonSevenConfig extends KeyboardButtonConfig {
  /// Constructs a [PageButtonSevenConfig].
  const PageButtonSevenConfig({int? flex}) : super(flex: flex);
}

/// List of keyboard button configs for the digits from 0-9.
///
/// List access from 0 to 9 will return the appropriate digit button.
final _digitButtons = [
  for (var i = 0; i < 10; i++)
    BasicKeyboardButtonConfig(
      label: '$i',
      value: '$i',
      keyboardCharacters: ['$i'],
    ),
];

const _decimalButton = BasicKeyboardButtonConfig(
  label: '.',
  value: '.',
  keyboardCharacters: ['.'],
  highlighted: true,
);

const _subtractButton = BasicKeyboardButtonConfig(
  label: '−',
  value: '-',
  keyboardCharacters: ['-'],
  highlighted: true,
);

/// Keyboard showing extended functionality.
final functionKeyboard =  [
  [
    const BasicKeyboardButtonConfig(
      label: r'\frac{\Box}{\Box}',
      value: r'\frac',
      args: [TeXArg.braces, TeXArg.braces],
      asTex: true,
      
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box^2',
      value: '^2',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box^{\Box}',
      value: '^',
      args: [TeXArg.braces],
      asTex: true,
      // keyboardCharacters: [
      //   '^',
      //   // This is a workaround for keyboard layout that use ^ as a toggle key.
      //   // In that case, "Dead" is reported as the character (e.g. for German
      //   // keyboards).
      //   'Dead',
      // ],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box_{\Box}',
      value: '_',
      args: [TeXArg.braces],
      asTex: true,
      keyboardCharacters: ['_'],
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\sqrt{\Box}',
      value: r'\sqrt',
      args: [TeXArg.braces],
      asTex: true,
      // keyboardCharacters: ['r'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sqrt[\Box]{\Box}',
      value: r'\sqrt',
      args: [TeXArg.brackets, TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\oint_{\Box}',
      value: r'\oint_',
      args: [TeXArg.braces],
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\cos',
      value: r'\cos(',
      asTex: true,
      // keyboardCharacters: ['c'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cos^{-1}',
      value: r'\cos^{-1}(',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sin',
      value: r'\sin(',
      asTex: true,
      // keyboardCharacters: ['s'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sin^{-1}',
      value: r'\sin^{-1}(',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\log_{\Box}(\Box)',
      value: r'\log_',
      asTex: true,
      args: [TeXArg.braces, TeXArg.parentheses],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ln(\Box)',
      value: r'\ln(',
      asTex: true,
      // keyboardCharacters: ['l'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\tan',
      value: r'\tan(',
      asTex: true,
      //   keyboardCharacters: ['t'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\tan^{-1}',
      value: r'\tan^{-1}(',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: 'space',
      value: r'\;',
      asTex: true,
      keyboardCharacters: [' '],
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: '(',
      value: '(',
      highlighted: true,
      keyboardCharacters: ['('],
    ),
    const BasicKeyboardButtonConfig(
      label: ')',
      value: ')',
      highlighted: true,
      keyboardCharacters: [')'],
    ),
    PreviousButtonConfig(),
    NextButtonConfig(),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];
final TrignoIntergDiff = [
  [
    const BasicKeyboardButtonConfig(
      label: r'\mu',
      value: r'\mu ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'|',
      value: r'|',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\widetilde{\Box}',
      value: r'\widetilde',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'!',
      value: r'! ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\theta',
      value: r'\theta ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\sin',
      value: r'\sin',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cos',
      value: r'\cos',
      asTex: true,
      // keyboardCharacters: ['s'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\tan',
      value: r'\tan',
      asTex: true,
      // keyboardCharacters: ['s'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cot',
      value: r'\cot',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\csc',
      value: r'\csc',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\sec',
      value: r'\sec',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\int',
      value: r'\int',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\iint',
      value: r'\iint',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\iiint',
      value: r'\iiint',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\oint',
      value: r'\oint ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\oiint',
      value: r'\oiint ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\oiiint',
      value: r'\oiiint ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\oint_{\Box}',
      value: r'\oint_',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\int_{\Box}',
      value: r'\int_',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r"{\Box}'",
      value: r"'",
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r"{\Box}''",
      value: r"''",
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\nabla',
      value: r'\nabla ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\dot\Box',
      value: r'\dot',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ddot\Box',
      value: r'\ddot',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\otimes',
      value: r'\otimes ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\circledast',
      value: r'\circledast ',
      asTex: true,
    ),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];
final PowerGreekExponentKeyboard = [
  [
    const BasicKeyboardButtonConfig(
      label: r'\Box^2',
      value: '^2',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box^{\Box}',
      value: '^',
      args: [TeXArg.braces],
      asTex: true,
      // keyboardCharacters: [
      //   '^',
      //   // This is a workaround for keyboard layout that use ^ as a toggle key.
      //   // In that case, "Dead" is reported as the character (e.g. for German
      //   // keyboards).
      //   'Dead',
      // ],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box_{\Box}',
      value: '_',
      args: [TeXArg.braces],
      asTex: true,
      keyboardCharacters: ['_'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sqrt{\Box}',
      value: r'\sqrt',
      args: [TeXArg.braces],
      asTex: true,
      // keyboardCharacters: ['r'],
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sqrt[\Box]{\Box}',
      value: r'\sqrt',
      args: [TeXArg.brackets, TeXArg.braces],
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\alpha',
      value: r'\alpha ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\beta',
      value: r'\beta ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\gamma',
      value: r'\gamma ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\delta',
      value: r'\delta ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Delta',
      value: r'\Delta ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\epsilon',
      value: r'\epsilon ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\eta',
      value: r'\eta ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Theta',
      value: r'\Theta ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\pi',
      value: r'\pi ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\rho',
      value: r'\rho ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\Sigma',
      value: r'\Sigma ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Sigma\Sigma',
      value: r'\Sigma\Sigma ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Omega',
      value: r'\Omega ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\phi',
      value: r'\phi ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Phi',
      value: r'\Phi ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\Psi',
      value: r'\Psi ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\chi',
      value: r'\chi ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\tau',
      value: r'\tau ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\upsilon',
      value: r'\upsilon ',
      asTex: true,
    ),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];

final GeometryTriangleLinesKeyboard = [
  [
    const BasicKeyboardButtonConfig(
      label: r'\angle',
      value: r'\angle ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\measuredangle',
      value: r'\measuredangle ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\triangle',
      value: r'\triangle ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sphericalangle',
      value: r'\sphericalangle ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\square',
      value: r'\square ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\circ',
      value: r'\circ ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Box^\circ',
      value: r'^\circ',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\rangle',
      value: r'\rangle ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\overline{\Box}',
      value: r'\overline',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\overrightarrow{\Box}',
      value: r'\overrightarrow',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\overleftrightarrow{\Box}',
      value: r'\overleftrightarrow',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\widehat {\Box}',
      value: r'\widehat ',
      args: [TeXArg.braces],
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\parallel',
      value: r'\parallel ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\perp',
      value: r'\perp ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cong',
      value: r'\cong ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sim',
      value: r'\sim ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\simeq',
      value: r'\simeq ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\Delta',
      value: r'\Delta ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\nsim',
      value: r'\nsim ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ncong',
      value: r'\ncong ',
      asTex: true,
    ),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];

/// Standard keyboard for math expression input.
List<List<KeyboardButtonConfig>> standartKeryboard(bool capslock) {
  List<List<KeyboardButtonConfig>> standardKeyboard = [
    [
      BasicKeyboardButtonConfig(
        label: capslock ? 'A' : 'a',
        value: capslock ? 'A' : 'a',
        keyboardCharacters: ['a'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'B' : 'b',
        value: capslock ? 'B' : 'b',
        keyboardCharacters: ['b'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'C' : 'c',
        value: capslock ? 'C' : 'c',
        keyboardCharacters: ['c'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'D' : 'd',
        value: capslock ? 'D' : 'd',
        keyboardCharacters: ['d'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'E' : 'e',
        value: capslock ? 'E' : 'e',
        keyboardCharacters: ['e'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'F' : 'f',
        value: capslock ? 'F' : 'f',
        keyboardCharacters: ['f'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'G' : 'g',
        value: capslock ? 'G' : 'g',
        keyboardCharacters: ['g'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'H' : 'h',
        value: capslock ? 'H' : 'h',
        keyboardCharacters: ['h'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'I' : 'i',
        value: capslock ? 'I' : 'i',
        keyboardCharacters: ['i'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'J' : 'j',
        value: capslock ? 'J' : 'j',
        keyboardCharacters: ['j'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'K' : 'k',
        value: capslock ? 'K' : 'k',
        keyboardCharacters: ['k'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'L' : 'l',
        value: capslock ? 'L' : 'l',
        keyboardCharacters: ['l'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'M' : 'm',
        value: capslock ? 'M' : 'm',
        keyboardCharacters: ['m'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'N' : 'n',
        value: capslock ? 'N' : 'n',
        keyboardCharacters: ['n'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'O' : 'o',
        value: capslock ? 'O' : 'o',
        keyboardCharacters: ['o'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'P' : 'p',
        value: capslock ? 'P' : 'p',
        keyboardCharacters: ['p'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'Q' : 'q',
        value: capslock ? 'Q' : 'q',
        keyboardCharacters: ['q'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'R' : 'r',
        value: capslock ? 'R' : 'r',
        keyboardCharacters: ['r'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'S' : 's',
        value: capslock ? 'S' : 's',
        keyboardCharacters: ['s'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'T' : 't',
        value: capslock ? 'T' : 't',
        keyboardCharacters: ['t'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'U' : 'u',
        value: capslock ? 'U' : 'u',
        keyboardCharacters: ['u'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'V' : 'v',
        value: capslock ? 'V' : 'v',
        keyboardCharacters: ['v'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'W' : 'w',
        value: capslock ? 'W' : 'w',
        keyboardCharacters: ['w'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'X' : 'x',
        value: capslock ? 'X' : 'x',
        keyboardCharacters: ['x'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'Y' : 'y',
        value: capslock ? 'Y' : 'y',
        keyboardCharacters: ['y'],
        highlighted: true,
      ),
      BasicKeyboardButtonConfig(
        label: capslock ? 'Z' : 'z',
        value: capslock ? 'Z' : 'z',
        keyboardCharacters: ['z'],
        highlighted: true,
      ),
    ],
    [
      _digitButtons[7],
      _digitButtons[8],
      _digitButtons[9],
      const BasicKeyboardButtonConfig(
        label: '×',
        value: r'\cdot',
        keyboardCharacters: ['*'],
        highlighted: true,
      ),
      const BasicKeyboardButtonConfig(
        label: '÷',
        value: r'\frac',
        keyboardCharacters: ['/'],
        args: [TeXArg.braces, TeXArg.braces],
        highlighted: true,
      ),
    ],
    [
      _digitButtons[4],
      _digitButtons[5],
      _digitButtons[6],
      const BasicKeyboardButtonConfig(
        label: '+',
        value: '+',
        keyboardCharacters: ['+'],
        highlighted: true,
      ),
      _subtractButton,
    ],
    [
      _digitButtons[1],
      _digitButtons[2],
      _digitButtons[3],
      _decimalButton,
      DeleteButtonConfig(),
    ],
    [
      _digitButtons[0],
      PreviousButtonConfig(),
      NextButtonConfig(),
      SubmitButtonConfig(),
    ],
    [
      const PageButtonOneConfig(),
      const PageButtonTwoConfig(),
      const PageButtonThreeConfig(),
      const PageButtonFourConfig(),
      const PageButtonFiveConfig(),
      const PageButtonSixConfig(),
      const PageButtonSevenConfig(),
    ],
  ];
  return standardKeyboard;
}

/// Keyboard getting shown for number input only.
final numberKeyboard = [
  [
    _digitButtons[7],
    _digitButtons[8],
    _digitButtons[9],
    _subtractButton,
  ],
  [
    _digitButtons[4],
    _digitButtons[5],
    _digitButtons[6],
    _decimalButton,
  ],
  [
    _digitButtons[1],
    _digitButtons[2],
    _digitButtons[3],
    DeleteButtonConfig(),
  ],
  [
    PreviousButtonConfig(),
    _digitButtons[0],
    NextButtonConfig(),
    SubmitButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];

final setTheoryKeyboard = [
  [
    const BasicKeyboardButtonConfig(
      label: r'\cup',
      value: r'\cup',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cap',
      value: r'\cap',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\subset',
      value: r'\subset',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\not\subset',
      value: r'\not\subset',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\subseteq',
      value: r'\subseteq',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\nsubseteq',
      value: r'\nsubseteq',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\supset',
      value: r'\supset',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\not\supset',
      value: r'\not\supset',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\supseteq',
      value: r'\supseteq',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\nsupseteq',
      value: r'\nsupseteq',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\Box^c',
      value: '^c',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\triangle',
      value: r'\triangle',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\in',
      value: r'\in',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\not\in',
      value: r'\not\in',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ni',
      value: r'\ni',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\not\ni',
      value: r'\not\ni',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{U}',
      value: r'\mathbb{U}',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{N}_0',
      value: r'\mathbb{N}_0',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{N}_1',
      value: r'\mathbb{N}_1',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{Z}',
      value: r'\mathbb{Z}',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{Q}',
      value: r'\mathbb{Q}',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{R}',
      value: r'\mathbb{R}',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mathbb{C}',
      value: r'\mathbb{C}',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\forall{x}',
      value: r'\forall{x}',
      asTex: true,
    ),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];
final arithmeticKeyboard = [
  [
    const BasicKeyboardButtonConfig(
      label: '+',
      value: '+',
      keyboardCharacters: ['+'],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: '-',
      value: '-',
      keyboardCharacters: ['-'],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\pm',
      value: r'\pm ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\mp',
      value: r'\mp ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ast',
      value: r'\ast ',
      keyboardCharacters: ['*'],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\times',
      value: r'\times ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\cdot',
      value: r'\cdot ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\div',
      value: r'\div ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'/',
      value: r'/',
      keyboardCharacters: ['/'],
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\%',
      value: r'\%',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: '=',
      value: '=',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\neq',
      value: r'\neq ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\approx',
      value: r'\approx ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\sim',
      value: r'\sim ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'<',
      value: r'<',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'>',
      value: r'>',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\le',
      value: r'\le ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ge',
      value: r'\ge ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: '[',
      value: '[',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: ']',
      value: ']',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\{',
      value: r'\{',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\}',
      value: r'\}',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: ':=',
      value: ':=',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\triangleq',
      value: r'\triangleq ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\propto',
      value: r'\propto ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\ll',
      value: r'\ll ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\gg',
      value: r'\gg ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\infty',
      value: r'\infty ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\&',
      value: r'\&',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'{\Box}\rq',
      value: r'\rq',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\overline{\Box}',
      value: r'\overline',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\lnot{\Box}',
      value: r'\lnot',
      args: [TeXArg.braces],
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\therefore ',
      value: r'\therefore  ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\because ',
      value: r'\because  ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: '!',
      value: '!',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\oplus',
      value: r'\oplus ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\implies',
      value: r'\implies ',
      asTex: true,
    ),
  ],
  [
    const BasicKeyboardButtonConfig(
      label: r'\Leftrightarrow',
      value: r'\Leftrightarrow ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\leftrightarrow',
      value: r'\leftrightarrow ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\exists',
      value: r'\exists ',
      asTex: true,
    ),
    const BasicKeyboardButtonConfig(
      label: r'\nexists',
      value: r'\nexists ',
      asTex: true,
    ),
    DeleteButtonConfig(),
  ],
  [
    const PageButtonOneConfig(),
    const PageButtonTwoConfig(),
    const PageButtonThreeConfig(),
    const PageButtonFourConfig(),
    const PageButtonFiveConfig(),
    const PageButtonSixConfig(),
    const PageButtonSevenConfig(),
  ],
];
