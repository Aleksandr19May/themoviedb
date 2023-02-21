import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войти в свою учётную запись'),
      ),
      body: ListView(
        children: const [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          const _FormWidget(),
          const SizedBox(
            height: 25,
          ),
          const Text('Войти в свою учётную запись',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
              style: style),
          const SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Register')),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
              style: style),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Verify email')),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('open app');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resertPassword() {
    print('resert password');
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    const textFieldDecoration = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    const style = TextStyle(fontSize: 16, color: Color(0xFF212529));
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText, // В массив children мы вносим подмассив Text и после условия if пишем три точки
            style: const TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
        const Text(
          'Имя пользователя',
          style: style,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: TextField(
            controller: _loginTextController,
            decoration: textFieldDecoration,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Пароль',
          style: style,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: TextField(
            controller: _passwordTextController,
            decoration: textFieldDecoration,
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              
                style: const ButtonStyle( 
                    backgroundColor: MaterialStatePropertyAll(color),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                onPressed: _auth,
                child: const Text('Login')),
            const SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: _resertPassword,
                style: AppButtonStyle.linkButton,
                child: const Text('Reset password')),
          ],
        )
      ],
    );
  }
}
