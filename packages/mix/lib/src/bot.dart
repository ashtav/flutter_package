import 'package:telebot/telebot.dart';

class Bot {
  /// ``` dart
  /// await Bot.sendMessage('Lorem ipsum ...','<token>','<chatId>');
  /// ```
  static Future sendMessage(String message, String token, String chatId) async {
    var bot = TelegramBot.init(token);
    bot.sendMessage(chatId: chatId, text: message);
  }
}
