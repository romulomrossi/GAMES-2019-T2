package;

import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.addons.ui.*;
import flixel.FlxG;

class MenuState extends FlxState
{

    override public function create():Void
    {
        var background = new FlxSprite();
        background.loadGraphic(AssetPaths.background__jpg);   

        var centerX = FlxG.width / 2;
        var centerY = FlxG.height / 2;
        
        var player = new FlxSprite();
        player.loadGraphic(AssetPaths.ship_menu__png);
        player.x = centerX - player.width / 2;
        player.y = centerY - 75;


        var startButton = new FlxButton(centerX - 40, centerY + 60, "Start", onPlay);
        
        add(background);
        add(startButton);
        add(player);

        super.create();
    }

    private function onPlay() 
    {
        FlxG.switchState(new PlayState());
    }
}