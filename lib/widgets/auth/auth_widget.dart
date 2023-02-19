import 'package:flutter/material.dart';


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
        children: const  [ _HeaderWidget()],
      ),
    );
  }
}


class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const style =  TextStyle(fontSize: 16,);
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:  const  [ SizedBox(height: 25,),
          _FormWidget(),
            SizedBox(height: 25,),
            Text('Войти в свою учётную запись',
           style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
           ),
            SizedBox(height: 25,),
           Text('Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',style: style),
            SizedBox(height: 25,),
           Text('Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',style: style),
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
  @override
  Widget build(BuildContext context) {
    const  textFieldDecoration =  InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 10 ), isCollapsed: true);
     const  style =  TextStyle(fontSize: 16, color: Color(0xFF212529));
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Имя пользователя',style: style,),
        TextField(
          decoration: textFieldDecoration,
        ),
        Text('Пароль',style: style,),
        TextField( decoration: textFieldDecoration,),
      ],
    );
  }
}