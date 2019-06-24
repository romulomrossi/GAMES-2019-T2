package;

import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.addons.ui.*;
import flixel.FlxG;

class MenuState extends FlxState
{
    var _playerNameInput:FlxInputText;
    
    var _localPortInput:FlxInputText;
    var _localIpInput:FlxInputText;

    var _hostPortInput:FlxInputText;
    var _hostIpInput:FlxInputText;

    var _startButton:FlxButton;

    override public function create():Void
    {
        var centerX = FlxG.width / 2;
        var centerY = FlxG.height / 2;

        _playerNameInput = new FlxInputText(centerX - 100/2, centerY - 90, 100, "Nickname");

        _localPortInput = new FlxInputText(centerX - 100/2, centerY - 60, 100, "8000");
        _localIpInput = new FlxInputText(centerX - 100/2, centerY - 30, 100, "127.0.0.1");

        _hostPortInput = new FlxInputText(centerX - 100/2, centerY, 100, "8000");
        _hostIpInput = new FlxInputText(centerX - 100/2, centerY + 30, 100, "192.168.0.106");

        //_serverPortInput.filterMode = FlxInputText.ONLY_NUMERIC;

        _startButton = new FlxButton(centerX - 40, centerY + 60, "Start", onPlay);
        
        add(_playerNameInput);        
        add(_localPortInput);
        add(_localIpInput);
        add(_hostPortInput);
        add(_hostIpInput);
        add(_startButton);
        super.create();
    }

    private function onPlay() 
    {
        FlxG.switchState(new PlayState());
    }
}