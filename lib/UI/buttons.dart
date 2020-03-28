import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Buttons extends StatefulWidget {
  @override
  ButtonsState createState() => ButtonsState();
}
class ButtonsState extends State<Buttons> {
  GFButtonShape _buttonType = GFButtonShape.standard;
  PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _icons = false;
  static const double INDICATOR_WIDTH = 10.0;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: GFAppBar(
        title: Text('Buttons'),
        backgroundColor: Color(0xff1a8caf)
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0
                      ),
                      child: Text(
                        'Button Shape',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _buttonType = GFButtonShape.standard;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Chip(
                          label: Text(
                            'Rounded',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                          backgroundColor: GFButtonShape.standard == _buttonType
                            ? Color(0xff1a8caf) : Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _buttonType = GFButtonShape.pills;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Chip(
                          label: Text(
                            'Pills',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                          backgroundColor: GFButtonShape.pills == _buttonType
                            ? Color(0xff1a8caf) : Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _buttonType = GFButtonShape.square;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Chip(
                          label: Text(
                            'Square',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                          backgroundColor: GFButtonShape.square == _buttonType
                            ? Color(0xff1a8caf) : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0
                      ),
                      child: Text(
                        'Icons?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _icons = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Chip(
                          label: Text(
                            'Icons',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                          backgroundColor: _icons ? Color(0xff1a8caf) : Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _icons = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Chip(
                          label: Text(
                            'No Icons',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                          backgroundColor: _icons ? Colors.grey : Color(0xff1a8caf),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 11,
            child: PageView(
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                buildSection(),
                buildSection(true),
                buildTransparentButtons(),
                buildBlockButtons(),
                buildSizedButtons(),
                buildOutlineButtons(),
                buildOutlineButtons(true),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: buildIndicators(7)
          ),
        ],
      ),
    );
  }

  Widget buildSection([bool disabled=false]) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              disabled ? 'Disabled Buttons' : 'Default Buttons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Primary',
              disabledTextColor: GFColors.WHITE,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.settings, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Secondary',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.SECONDARY,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Success',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.SUCCESS,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save_alt, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Warning',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.WARNING,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.warning, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Danger',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.DANGER,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.cancel, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Info',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.INFO,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.info, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Light',
              disabledTextColor: GFColors.DARK,
              color: GFColors.LIGHT,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.image, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Dark',
              disabledTextColor: GFColors.WHITE,
              color: GFColors.DARK,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.delete_outline, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: disabled ? null : () {},
              text: 'Link',
              textColor: Colors.blue,
              color: disabled ? GFColors.WHITE.withOpacity(1) : GFColors.TRANSPARENT,
              shape: this._buttonType,
            )
          ],
        ),
      ),
    );
  }

  Widget buildTransparentButtons() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Transparent Buttons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            GFButton(
              onPressed: () {},
              text: 'Primary',
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Secondary',
              textColor: GFColors.SECONDARY,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Success',
              textColor: GFColors.SUCCESS,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Warning',
              textColor: GFColors.WARNING,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Danger',
              textColor: GFColors.DANGER,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Info',
              textColor: GFColors.INFO,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Light',
              textColor: GFColors.LIGHT,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Dark',
              textColor: GFColors.DARK,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
            GFButton(
              onPressed: () {},
              text: 'Link',
              textColor: GFColors.TRANSPARENT,
              type: GFButtonType.transparent,
              shape: this._buttonType,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlockButtons() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Block Buttons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            GFButton(
              onPressed: () {},
              text: 'Primary',
              color: GFColors.PRIMARY,
              blockButton: true,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.settings, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Secondary',
              color: GFColors.SECONDARY,
              blockButton: true,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Success',
              color: GFColors.SUCCESS,
              blockButton: true,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save_alt, color: Colors.white,) : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSizedButtons() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sized Buttons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            GFButton(
              onPressed: () {},
              text: 'Primary',
              color: GFColors.PRIMARY,
              size: GFSize.SMALL,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.settings, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Secondary',
              color: GFColors.SECONDARY,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save, color: Colors.white,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Success',
              color: GFColors.SUCCESS,
              size: GFSize.LARGE,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save_alt, color: Colors.white,) : null,
            )
          ],
        ),
      ),
    );
  }

  Widget buildOutlineButtons([bool outline2 = false]) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              outline2 ? 'Outline Buttons 2x' : 'Outline Buttons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            GFButton(
              onPressed: () {},
              text: 'Primary',
              color: GFColors.PRIMARY,
              type: outline2 ? GFButtonType.outline2x : GFButtonType.outline,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.settings, color: GFColors.PRIMARY,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Secondary',
              color: GFColors.SECONDARY,
              type: outline2 ? GFButtonType.outline2x : GFButtonType.outline,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save, color: GFColors.SECONDARY,) : null,
            ),
            GFButton(
              onPressed: () {},
              text: 'Success',
              color: GFColors.SUCCESS,
              type: outline2 ? GFButtonType.outline2x : GFButtonType.outline,
              shape: this._buttonType,
              icon: _icons ? Icon(Icons.save_alt, color: GFColors.SUCCESS,) : null,
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicators(int number) {
    List<Widget> rowChildren = [];
    for (int i = 0; i < number; i++) {
      rowChildren.add(
        Container(
          width: INDICATOR_WIDTH,
          height: INDICATOR_WIDTH,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Color(0xff00afbf) : Colors.grey
          )
        ),
      );
      if (i != number - 1) {
        rowChildren.add(SizedBox(width: 5.0,));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren
    );
  }
}
