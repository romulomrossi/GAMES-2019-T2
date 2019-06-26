package;

import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.FlxSprite;

class Meteor extends FlxSprite
{
    var _player:Player;
    public var size:Int;

    public function new(player:Player) 
    {
        _player = player;
        super();
        kill();
    }

    public function respawn()
    {
        size = Std.random(3);

        this.health = size * 10;

        switch (size)
        {
            case 1:
                loadGraphic(AssetPaths.asteroid_small__png, false, 32, 32);   
            case 2:
                loadGraphic(AssetPaths.asteroid_med__png, false, 32, 32);   
            case 3:
                loadGraphic(AssetPaths.asteroid_big__png, false, 32, 32);   
            default:
                loadGraphic(AssetPaths.asteroid_small__png, false, 32, 32);   
        }

        var initialX = Std.random(FlxG.width);
        var initialY = Std.random(FlxG.height);

        var point = new FlxPoint();
        
        if(point.inCoords(_player.x, _player.y, 50, 50))
            return;

        this.reset(initialX, initialY);
        this.velocity.x = Std.random(30);
        this.velocity.y = Std.random(30);
    }

    override public function update(e:Float)
    {   
        if(FlxCollision.pixelPerfectCheck(this, _player))
            _player.kill();
    
        if(!isOnScreen())
            kill();

        super.update(e);    
    }
}