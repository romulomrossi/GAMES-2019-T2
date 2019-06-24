package;

import flixel.addons.plugin.taskManager.FlxTask;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
    var _player:Player;

    override public function create():Void
    {
        _player = new Player();
        add(_player);

        super.create();
    }

    override public function update(e:Float)
    {


        super.update(e);
    }

}